from django.contrib import admin
from .models import Reporter, Remind, Computer, ComputerProblem


class ReporterAdmin(admin.ModelAdmin):
    list_display = ('id', 'reporter_ip', )
    search_fields = ['id', 'reporter_ip']


class RemindAdmin(admin.ModelAdmin):
    list_display = ('id', 'remind_email')
    search_fields = ('id', 'remind_email')


class ComputerAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'computer_no', 'computer_ip', 'computer_class', 'report_count')
    search_fields = ['computer_no', 'computer_ip']


class ComputerProblemAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'computer', 'problem_type', 'problem_desc',
        'problem_situation', 'problem_status', 'report_time')
    search_fields = [
        'problem_type', 'problem_desc', 'problem_situation', 'problem_status']


admin.site.register(Reporter, ReporterAdmin)
admin.site.register(Remind, RemindAdmin)
admin.site.register(Computer, ComputerAdmin)
admin.site.register(ComputerProblem, ComputerProblemAdmin)
