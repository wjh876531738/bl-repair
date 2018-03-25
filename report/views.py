from django.shortcuts import render
from django.http import JsonResponse

from django.utils.six import BytesIO

from bl_repair.settings import BASE_DIR

from .forms import ComputerProblemFrom
from .models import Computer
from .models import Reporter
from .models import ComputerProblem

from rest_framework import generics
from rest_framework.response import Response

from .serializers import ComputerProblemSerializer
from .serializers import ComputerSerializer
from .serializers import ComputerClassSerializer

import qrcode
import hashlib
import os
import zipfile
import time
from .mailer import send


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

        if computer_problem_form.is_valid():
            computer_id = computer_problem_form.cleaned_data['computer']
            problem_type = computer_problem_form.cleaned_data['problem_type']
            problem_desc = computer_problem_form.cleaned_data['problem_desc']
            problem_situation = computer_problem_form.cleaned_data['problem_situation']

            try:
                real_ip = request.META['HTTP_X_FORWARDED_FOR']
            except KeyError:
                real_ip = 'None'
            else:
                real_ip = real_ip.split(",")[0]
                request.META['REMOTE_ADDR'] = real_ip

            reporter = Reporter.objects.create(reporter_ip=real_ip)
            # 报障次数 +1
            computer = Computer.objects.get(id=computer_id)
            computer.report_count = computer.report_count + 1
            computer.save()

            ComputerProblem.objects.create(
                reporter=reporter,
                computer=computer,
                problem_type=problem_type,
                problem_desc=problem_desc,
                problem_situation=problem_situation,
                problem_status=0)

            computer_problem_form = ComputerProblemFrom()

            # send()

            return render(request, 'report/new.html', {
                'computer_problem_form': computer_problem_form,
                'msg': '谢谢您的上报, 我们会尽快维修.'})
        else:
            computer_problem_form = ComputerProblemFrom()
            return render(request, 'report/new.html', {
                'msg': '输入错误, 请重新输入.',
                'computer_problem_form': computer_problem_form})
    else:
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
        return render(request, 'report/new.html',
                {'computer_problem_form': computer_problem_form})


# 生成二维码
def generate_qrcode(request):
    if not os.path.exists(os.path.join(BASE_DIR, 'media/qrcode')):
        os.mkdir(os.path.join(BASE_DIR, 'media/qrcode'))
    if not os.path.exists(os.path.join(BASE_DIR, 'media/qrcode/cache')):
        os.mkdir(os.path.join(BASE_DIR, 'media/qrcode/cache'))

    server_host = 'http://192.168.199.197'

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
                with open(os.path.join(BASE_DIR, 'media/qrcode', filename), 'wb+') as f:
                    img.save(f)
            return JsonResponse({'msg': 'OK', 'path': filename})
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
                        with open(os.path.join(BASE_DIR, 'media/qrcode', filename), 'wb+') as f:
                            img.save(f)

                    # 将二维码放进压缩文件包
                    zip_f.write(os.path.join(BASE_DIR, 'media/qrcode', filename), filename)
                return JsonResponse({'msg': 'OK', 'path': os.path.join(server_host, 'media/qrcode/cache/%s.zip' % computer_class)})
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
    queryset = ComputerProblem.objects.all()
    serializer_class = ComputerProblemSerializer


# Computer Problem Retrieve, Update, Destroy
class ComputerProblemDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = ComputerProblem.objects.all()
    serializer_class = ComputerProblemSerializer


# Computer List
class ComputerList(generics.ListAPIView):
    queryset = Computer.objects.all()
    serializer_class = ComputerSerializer

    def list(self, request, *args, **kwargs):
        # Return all computer data with `class, no` fields if request has param `all` equal to 1
        if 'all' in request.GET and request.GET.get('all') == '1':
            queryset = self.get_queryset().values('computer_class', 'computer_no')
            return Response(queryset)

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
