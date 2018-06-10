from rest_framework import serializers
from .models import ComputerProblem, Computer, Reporter, Remind


class ComputerSerializer(serializers.ModelSerializer):

    class Meta:
        model = Computer
        fields = '__all__'


class ComputerProblemSerializer(serializers.ModelSerializer):
    computer = ComputerSerializer(many=False, read_only=True)

    class Meta:
        model = ComputerProblem
        fields = (
            'id',
            'computer',
            'problem_type',
            'problem_desc',
            'problem_situation',
            'problem_status',
            'report_time'
        )
        # fields = '__all__'


class ComputerClassSerializer(serializers.Serializer):
    computer_class = serializers.CharField(max_length=255)


class ReporterSerializer(serializers.ModelSerializer):
    computer_problems = ComputerProblemSerializer(many=True, read_only=True)

    class Meta:
        model = Reporter
        # fields = ('reporter_ip', 'computer_problems')
        fields = '__all__'


class RemindSerializer(serializers.ModelSerializer):

    class Meta:
        model = Remind
        ordering = 'id'
        fields = '__all__'
