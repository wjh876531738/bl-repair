from django.shortcuts import render
from django.http import HttpResponse, JsonResponse

from django.utils.six import BytesIO

from .forms import ComputerProblemFrom
from .models import Computer, Reporter, ComputerProblem

from rest_framework import viewsets
from .serializers import ComputerProblemSerializer, ComputerSerializer, ReporterSerializer

import qrcode, os, json
import pandas as pd

# Create your views here.
HOST = 'http://192.168.43.62:8000'

# 报障表单的提交处理
def new(request):
    if request.method == 'POST':
        computer_problem_form = ComputerProblemFrom(request.POST)

        if computer_problem_form.is_valid():
            computer_class = computer_problem_form.cleaned_data['computer_class']
            computer_no = computer_problem_form.cleaned_data['computer_no']
            problem_type = computer_problem_form.cleaned_data['problem_type']
            problem_desc = computer_problem_form.cleaned_data['problem_desc']
            problem_situation = computer_problem_form.cleaned_data['problem_situation']
            computer_ip = computer_problem_form.cleaned_data['computer_ip']

            try:
                real_ip = request.META['HTTP_X_FORWARDED_FOR']
            except KeyError:
                real_ip = 'None'
            else:
                real_ip=real_ip.split(",")[0]
                request.META['REMOTE_ADDR']=real_ip

            reporter = Reporter.objects.create(reporter_ip=real_ip)
            # TODO 验证reporter是否发送多个请求

            computer, create_success = Computer.objects.get_or_create(computer_class=computer_class, computer_no=computer_no)
            if create_success:
                computer.report_count = computer.report_count + 1
            else:
                computer.computer_ip = computer_ip
            computer.save()

            computer_problem = ComputerProblem.objects.create(reporter=reporter, computer=computer, problem_type=problem_type, problem_desc=problem_desc, problem_situation=problem_situation, problem_status=0)

            computer_problem_form = ComputerProblemFrom()
            return render(request, 'report/new.html', { 'computer_problem_form': computer_problem_form, 'msg': '谢谢您的上报, 我们会尽快维修的.' })
        else:
            computer_problem_form = ComputerProblemFrom()
            return render(request, 'report/new.html', { 'msg': '输入错误, 请重新输入.', 'computer_problem_form': computer_problem_form })
    else:
        computer_problem_form = ComputerProblemFrom()
        return render(request, 'report/new.html', { 'computer_problem_form': computer_problem_form })

# 生成二维码
def generate_qrcode(request):
    global HOST
    computer_no = request.GET.get('computer_no', 1)
    computer_class = request.GET.get('computer_class', 'za207')

    img = qrcode.make(HOST+'/report/new/computer_no='+computer_no+'&computer_class='+computer_class)

    # 保存二维码到文件
    # if not os.path.exists(os.path.join('uploads', computer_class)):
        # os.mkdir(os.path.join('uploads', computer_class))

    # if not os.path.exists(os.path.join('uploads/'+computer_class, computer_no)):
        # os.mkdir(os.path.join('uploads/'+computer_class, computer_no))

    # filename = computer_no + computer_class + '.png'
    # with open('/home/wjh/project/bl_repair/uploads/'+computer_class+'/'+computer_no+'/'+filename, 'wb+') as f:
        # img.save(f)

    # 直接显示到网页
    buf = BytesIO()
    img.save(buf)
    image_stream = buf.getvalue()

    response = HttpResponse(image_stream, content_type="image/png")
    return response

class ComputerProblemViewSet(viewsets.ModelViewSet):
    queryset = ComputerProblem.objects.all()
    serializer_class = ComputerProblemSerializer

class ComputerViewSet(viewsets.ModelViewSet):
    queryset = Computer.objects.all()
    serializer_class = ComputerSerializer

class ReporterViewSet(viewsets.ModelViewSet):
    queryset = Reporter.objects.all()
    serializer_class = ReporterSerializer
