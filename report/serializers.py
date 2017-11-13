from rest_framework import serializers
from .models import ComputerProblem, Computer, Reporter

class ComputerProblemSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = ComputerProblem
        fields = ('id', 'problem_type', 'problem_desc', 'problem_situation', 'problem_status', 'report_time')

class ComputerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Computer
        fields = ('id', 'computer_class', 'computer_no', 'computer_ip', 'report_count')

class ReporterSerializer(serializers.HyperlinkedModelSerializer):
    computer_problems = ComputerProblemSerializer(many=True, read_only=True)
    class Meta:
        model = Reporter
        fields = ('reporter_ip', 'computer_problems')
