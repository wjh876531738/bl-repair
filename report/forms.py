from django import forms
from .models import Computer

from .models import COMPUTER_PROBLEM_TYPE_CHOICES, COMPUTER_PROBLEM_SITUATION_CHOICES


class ComputerProblemFrom(forms.Form):
    computers = Computer.objects.all()
    computer_choice = []
    for i in computers:
        computer_choice.append((i.id, str(i)))

    computer = forms.ChoiceField(choices=computer_choice, label='机房课室')
    problem_type = forms.ChoiceField(
        choices=COMPUTER_PROBLEM_TYPE_CHOICES, label='问题类型')
    problem_desc = forms.CharField(widget=forms.Textarea, label='问题描述')
    problem_situation = forms.ChoiceField(
        choices=COMPUTER_PROBLEM_SITUATION_CHOICES, label='问题情况')

    def __init__(self, *args, **kwargs):
        super(ComputerProblemFrom, self).__init__(*args, **kwargs)

        self.fields['computer'].widget.attrs.update(
            {'placeholder': '请选择所在的机房'})
        # self.fields['computer'].widget.attrs['disabled'] = True

        self.fields['problem_desc'].widget.attrs.update(
            {'placeholder': '请描述电脑的大致情况'})
        self.fields['problem_situation'].widget.attrs.update(
            {'placeholder': '请选择电脑故障的程度'})
