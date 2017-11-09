from django.contrib import admin
from .models import Reporter, Computer, ComputerProblem

# Register your models here.

class ReporterAdmin(admin.ModelAdmin):
    list_display = ('reporter_ip', )
    search_fields = ['reporter_ip']


class ComputerAdmin(admin.ModelAdmin):
    list_display = ('computer_no', 'computer_ip', 'computer_class', 'report_count')
    search_fields = ['computer_no', 'computer_ip']


class ComputerProblemAdmin(admin.ModelAdmin):
    list_display = ('id', 'computer', 'problem_type', 'problem_desc', 'problem_situation', 'problem_status', 'report_time')
    search_fields = ['problem_type', 'problem_desc', 'problem_situation', 'problem_status']

admin.site.register(Reporter, ReporterAdmin)
admin.site.register(Computer, ComputerAdmin)
admin.site.register(ComputerProblem, ComputerProblemAdmin)
