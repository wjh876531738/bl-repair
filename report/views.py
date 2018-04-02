from django.shortcuts import render
from django.http import JsonResponse
from django.http import FileResponse

from django.utils.six import BytesIO

from bl_repair.settings import BASE_DIR

from .forms import ComputerProblemFrom

from .models import Computer
from .models import Reporter
from .models import ComputerProblem
from .models import Remind
from .models import COMPUTER_PROBLEM_TYPE_CHOICES
from .models import COMPUTER_PROBLEM_SITUATION_CHOICES

from rest_framework import generics
from rest_framework.response import Response

from django_filters.rest_framework import DjangoFilterBackend

from .serializers import ComputerProblemSerializer
from .serializers import ComputerSerializer
from .serializers import ComputerClassSerializer
from .serializers import RemindSerializer

import qrcode
import hashlib
import os
import zipfile
import time
from .mailer import send
from PIL import Image, ImageDraw, ImageFont


# 报障记录
def index(request):
    computer_problems = ComputerProblem.objects.all()
    return render(request, 'report/index.html',
            {'computer_problems': computer_problems})


def about(request):
    return render(request, 'report/about.html')


# 报障表单的提交处理
def new(request):
    if request.method == 'POST':
        computer_problem_form = ComputerProblemFrom(request.POST)

        # Validate form data
        if computer_problem_form.is_valid():
            computer_id = computer_problem_form.cleaned_data['computer']
            problem_type = computer_problem_form.cleaned_data['problem_type']
            problem_desc = computer_problem_form.cleaned_data['problem_desc']
            problem_situation = computer_problem_form.cleaned_data['problem_situation']

            # Get user ip and save into reporter
            try:
                real_ip = request.META['HTTP_X_FORWARDED_FOR']
            except KeyError:
                real_ip = 'None'
            else:
                real_ip = real_ip.split(",")[0]
                request.META['REMOTE_ADDR'] = real_ip

            reporter = Reporter.objects.create(reporter_ip=real_ip)

            # 报障次数 + 1
            computer = Computer.objects.get(id=computer_id)
            computer.report_count = computer.report_count + 1
            computer.save()

            # Return msg if the computer has been reported
            if len(ComputerProblem.objects.filter(computer=computer)) > 0:  
                return render(request, 'report/new.html', {
                    'computer_problem_form': computer_problem_form,
                    'msg': '谢谢您的上报, 该故障已有人上报，请勿重复报障',
                    'msg_type': 'error'
                    })

            # Update ComputerProblem
            ComputerProblem.objects.create(
                reporter=reporter,
                computer=computer,
                problem_type=problem_type,
                problem_desc=problem_desc,
                problem_situation=problem_situation,
                problem_status=0)

            # Send email to the reminder
            remind = Remind.objects.get(id=1)

            if remind:
                msg = '<h1>%s %s 电脑发生故障</h1> </br> 问题类型：%s </br> 故障程度：%s </br> 故障情况：%s </br> </br> 请及时处理' % (
                        computer.computer_class,
                        computer.computer_no,
                        COMPUTER_PROBLEM_TYPE_CHOICES[int(problem_type)][1],
                        COMPUTER_PROBLEM_SITUATION_CHOICES[int(problem_situation)][1],
                        problem_desc,
                        )
                # send(remind.remind_email, msg)

            return render_form_with_param(request, msg= '谢谢您的上报，我们会尽快维修')
        else:
            return render_form_with_param(request, msg= '输入错误，请重新输入')
    else:
        return render_form_with_param(request)


def render_form_with_param(request, msg=None):
    if 'computer_class' in request.GET and 'computer_no' in request.GET:
        computer = Computer.objects.filter(
                computer_class=request.GET.get('computer_class'),
                computer_no=request.GET.get('computer_no'),
                )
        if computer:
            computer_problem_form = ComputerProblemFrom({
                    'computer': computer.first().id,
                    'problem_type': 0,
                    'problem_situation': 0,
                })
        else:
            computer_problem_form = ComputerProblemFrom()
    else:
        computer_problem_form = ComputerProblemFrom()

    if msg:
        return render(request, 'report/new.html', {
            'msg': msg,
            'computer_problem_form': computer_problem_form})
    else:
        return render(request, 'report/new.html',
                {'computer_problem_form': computer_problem_form})


# 生成二维码
def generate_qrcode(request):
    if not os.path.exists(os.path.join(BASE_DIR, 'media/qrcode')):
        os.mkdir(os.path.join(BASE_DIR, 'media/qrcode'))
    if not os.path.exists(os.path.join(BASE_DIR, 'media/qrcode/cache')):
        os.mkdir(os.path.join(BASE_DIR, 'media/qrcode/cache'))

    server_host = 'http://www.fsociety.ink/repair'

    # Validate params
    # 1. 根据指定电脑生成一张二维码
    if 'computer_no' in request.GET and 'computer_class' in request.GET:
        computers = Computer.objects.filter(
                    computer_class=request.GET.get('computer_class'),
                    computer_no=request.GET.get('computer_no')
                )
        if computers:
            computer = computers.first()
            filename = '%s_%s.png' % (computer.computer_class, computer.computer_no)

            # 如果二维码不存在就生成
            if not os.path.exists(os.path.join(BASE_DIR, 'media/qrcode', filename)):
                img = qrcode.make(
                        '%s/report/new?computer_class=%s&computer_no=%s' % (
                            server_host, computer.computer_class, computer.computer_no))

                # 添加文字到二维码当中
                img_back = Image.new('RGB', (450, 550), 'white')
                img_white = Image.new('RGB', (450, 100), "white")
                img_x, img_y = img_white.size

                # Add text to imgage
                ttfont = ImageFont.truetype(os.path.join(BASE_DIR, 'media/font.ttf'), int(img_y/3))
                draw = ImageDraw.Draw(img_white)

                text = "%s-%s" % (computer.computer_class, computer.computer_no)
                draw.text((img_x/2-len(text)*9, (img_y/3)-30), text, (0, 0, 0), ttfont)
                draw.text((img_x/2-60, (img_y*2/3)-20), "扫我报障", (0, 0, 0), ttfont)

                img_back.paste(img, (0, 0))
                img_back.paste(img_white, (0, 450))

                with open(os.path.join(BASE_DIR, 'media/qrcode', filename), 'wb+') as f:
                    img_back.save(f)

            # Marked! 不能通过 with 打开文件，否则 FileResponse 会抛出 ValueError: read of closed file
            f = open(os.path.join(BASE_DIR, 'media/qrcode', filename), 'rb')

            response = FileResponse(f)
            response['Content-Type'] = 'application/octet-stream'
            response['Content-Disposition'] = 'attachment;filename="%s"' % (filename,)
            return response
        else:
            return JsonResponse({'msg': '找不到指定的电脑，请检查电脑所在课室和编号是否正确'}, status=400)

    # 2. 根据指定机房生成整个机房的二维码
    elif 'computer_class' in request.GET:
        computer_class = request.GET.get('computer_class')
        computers = Computer.objects.filter(
                    computer_class=request.GET.get('computer_class')
                )
        if computers:
            result = []
            try:
                # 压缩工具
                zip_path = os.path.join(BASE_DIR, 'media/qrcode/cache',
                        '%s.zip' % computer_class)
                zip_f = zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED)

                # 遍历指定机房的所有电脑
                for computer in computers:
                    filename = '%s_%s.png' % (computer.computer_class, computer.computer_no)

                    # 如果二维码不存在就生成
                    if not os.path.exists(os.path.join(BASE_DIR, 'media/qrcode', filename)):
                        img = qrcode.make(
                                '%s/report/new?computer_class=%s&computer_no=%s' % (
                                    server_host, computer.computer_class, computer.computer_no))

                        # 添加文字到二维码当中
                        img_back = Image.new('RGB', (450, 550), 'white')
                        img_white = Image.new('RGB', (450, 100), "white")
                        img_x, img_y = img_white.size

                        # Add text to imgage
                        ttfont = ImageFont.truetype(os.path.join(BASE_DIR, 'media/font.ttf'), int(img_y/3))
                        draw = ImageDraw.Draw(img_white)

                        text = "%s-%s" % (computer.computer_class, computer.computer_no)
                        draw.text((img_x/2-len(text)*9, (img_y/3)-30), text, (0, 0, 0), ttfont)
                        draw.text((img_x/2-60, (img_y*2/3)-20), "扫我报障", (0, 0, 0), ttfont)

                        img_back.paste(img, (0, 0))
                        img_back.paste(img_white, (0, 450))

                        with open(os.path.join(BASE_DIR, 'media/qrcode', filename), 'wb+') as f:
                            img_back.save(f)

                    # 将二维码放进压缩文件包
                    zip_f.write(os.path.join(BASE_DIR, 'media/qrcode', filename), filename)

                f = open(os.path.join(BASE_DIR, 'media/qrcode/cache',
                        '%s.zip' % computer_class), 'rb')
                response = FileResponse(f)
                response['Content-Type'] = 'application/octet-stream'
                response['Content-Disposition'] = 'attachment;filename="%s.zip"' % (computer_class,)
                return response
            except Exception as e:
                print(e)
            finally:
                zip_f.close()
        else:
            return JsonResponse({'msg': '找不到指定的电脑，请检查电脑所在课室是否正确'}, status=400)

    # 3. 参数错误, 返回对应信息
    else:
        return JsonResponse({'msg': 'Params computer_class is required!'}, status=400)
        

    # 保存二维码到文件
    # if not os.path.exists(os.path.join('uploads', computer_class)):
    # os.mkdir(os.path.join('uploads', computer_class))

    # if not os.path.exists(os.path.join('uploads/'+computer_class, computer_no)):
    # os.mkdir(os.path.join('uploads/'+computer_class, computer_no))

    # filename = computer_no + computer_class + '.png'
    # with open('/home/wjh/project/bl_repair/uploads/'+computer_class+'/'+computer_no+'/'+filename, 'wb+') as f:
    # img.save(f)

    # 直接显示到网页
    # buf = BytesIO()
    # img.save(buf)
    # image_stream = buf.getvalue()


# Computer Problem List, Create
class ComputerProblemList(generics.ListCreateAPIView):
    queryset = ComputerProblem.objects.all().order_by('-problem_situation', 'problem_status', '-report_time')
    serializer_class = ComputerProblemSerializer
    filter_fields = (
            'computer', 'problem_type', 'problem_desc',
            'problem_situation', 'problem_status'
            )

    def list(self, request):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


# Computer Problem Retrieve, Update, Destroy
class ComputerProblemDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = ComputerProblem.objects.all()
    serializer_class = ComputerProblemSerializer


# Computer List
class ComputerList(generics.ListCreateAPIView):
    queryset = Computer.objects.all().order_by('computer_class', 'computer_no')
    serializer_class = ComputerSerializer
    filter_fields = ('computer_class', 'computer_no')

    # Rewrite the list method
    def list(self, request, *args, **kwargs):
        # Return all computer data with `class, no` fields if request has param `all` equal to 1
        if 'all' in request.GET and request.GET.get('all') == '1':
            queryset = self.get_queryset().values('computer_class', 'computer_no')
            return Response(queryset)

            queryset = self.filter_queryset(self.get_queryset())
        else:
            queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

# Computer Retrieve
class ComputerDetail(generics.RetrieveAPIView):
    queryset = Computer.objects.all()
    serializer_class = ComputerSerializer


# Computer Class List
class ComputerClassList(generics.ListAPIView):
    queryset = Computer.objects.values('computer_class').distinct()
    serializer_class = ComputerClassSerializer
    pagination_class = None


class RemindList(generics.ListCreateAPIView):
    queryset = Remind.objects.all()
    serializer_class = RemindSerializer


class RemindDetail(generics.RetrieveUpdateAPIView):
    queryset = Remind.objects.all()
    serializer_class = RemindSerializer
