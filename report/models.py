from django.db import models

# Create your models here.

class Reporter(models.Model):
    reporter_ip = models.CharField(max_length=25)

    def __str__(self):
        return self.reporter_ip

class Computer(models.Model):
    computer_class = models.CharField(max_length=10)
    computer_no = models.CharField(max_length=5)
    computer_ip = models.CharField(max_length=25, default='')
    report_count = models.IntegerField(default=0)

    def __str__(self):
        return self.computer_class + ' ' + self.computer_no

class ComputerProblem(models.Model):
    reporter = models.ForeignKey(Reporter)
    computer = models.ForeignKey(Computer)
    problem_type = models.IntegerField()
    problem_desc = models.TextField()
    problem_situation = models.IntegerField()
    problem_status = models.IntegerField()
    report_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.problem_desc + str(self.report_time)
