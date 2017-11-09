from django import forms
from .models import Computer

class ComputerProblemFrom(forms.Form):
    all_class = Computer.objects.all().values('computer_class').distinct()
    class_tuple = []
    for i in all_class:
        class_tuple.append((i['computer_class'], i['computer_class']))

    computer_class = forms.ChoiceField(choices=class_tuple, label='机房课室')
    computer_no = forms.CharField(max_length=5, label='计算机编号')
    problem_type = forms.ChoiceField(choices=((0, '显示器'), (1, '音响'), (2, '主机'), (3, '网络'), (4, '键鼠'), (5, '其他')), label='问题类型')
    problem_desc = forms.CharField(widget=forms.Textarea, label='问题描述')
    problem_situation = forms.ChoiceField(choices=((0, '小问题'), (1, '一般'), (2, '严重'), (3, '紧急')), label='问题情况')
    computer_ip = forms.CharField(max_length=25, label='计算机IP')

    def __init__(self, *args, **kwargs):
        super(ComputerProblemFrom, self).__init__(*args, **kwargs)
        self.fields['computer_class'].widget.attrs.update({'placeholder': '请选择所在的机房'})
        self.fields['computer_no'].widget.attrs.update({'placeholder': '请输入显示器下标签的编号'})
        self.fields['problem_desc'].widget.attrs.update({'placeholder': '请描述电脑的大致情况'})
        self.fields['problem_situation'].widget.attrs.update({'placeholder': '请选择电脑故障的程度'})
        # self.fields['computer_ip'].widget.attrs.update({'placeholder': '请输入电脑的IP (可通过下方提示查询机器IP)'})
