from django.db import models

COMPUTER_PROBLEM_TYPE_CHOICES = (
    (0, '显示器'), (1, '主机'), (2, '网络'), (3, '键鼠'), (4, '其他'))
COMPUTER_PROBLEM_SITUATION_CHOICES = (
    (0, '一般'), (1, '严重'), (2, '紧急'))
COMPUTER_PROBLEM_STATUS_CHOICES = ((0, '刚报修'), (1, '已维修'), (2, '待处理'))


# 报障提交者
class Reporter(models.Model):
    reporter_ip = models.CharField(max_length=25)

    def __str__(self):
        return self.reporter_ip


# 邮件提醒
class Remind(models.Model):
    remind_email = models.CharField(max_length=30)

    def __str__(self):
        return self.computer + self.remind_email


# 电脑
class Computer(models.Model):
    computer_class = models.CharField(max_length=10)
    computer_no = models.CharField(max_length=5)
    computer_ip = models.CharField(max_length=25, default='')
    report_count = models.IntegerField(default=0)
    # remind = models.ForeignKey(Remind)

    def __str__(self):
        return self.computer_class + ' ' + self.computer_no


# 电脑问题
class ComputerProblem(models.Model):
    reporter = models.ForeignKey(Reporter, on_delete=False)
    computer = models.ForeignKey(Computer, on_delete=False)
    problem_type = models.IntegerField(
        choices=COMPUTER_PROBLEM_TYPE_CHOICES)
    problem_desc = models.TextField()
    problem_situation = models.IntegerField(
        choices=COMPUTER_PROBLEM_SITUATION_CHOICES)
    problem_status = models.IntegerField(
        choices=COMPUTER_PROBLEM_STATUS_CHOICES)
    report_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.problem_desc + str(self.report_time)
