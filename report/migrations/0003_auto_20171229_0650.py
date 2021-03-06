# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-12-29 06:50
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('report', '0002_auto_20171229_0310'),
    ]

    operations = [
        migrations.CreateModel(
            name='Remind',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('remind_email', models.CharField(max_length=30)),
            ],
        ),
        migrations.AlterField(
            model_name='computerproblem',
            name='problem_situation',
            field=models.IntegerField(choices=[(0, '一般'), (1, '严重'), (2, '紧急')]),
        ),
        migrations.AlterField(
            model_name='computerproblem',
            name='problem_type',
            field=models.IntegerField(choices=[(0, '显示器'), (1, '主机'), (2, '网络'), (3, '键鼠'), (4, '其他')]),
        ),
    ]
