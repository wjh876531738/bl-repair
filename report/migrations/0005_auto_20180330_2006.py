# Generated by Django 2.0.3 on 2018-03-30 12:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('report', '0004_auto_20180325_1117'),
    ]

    operations = [
        migrations.AlterField(
            model_name='computer',
            name='computer_no',
            field=models.IntegerField(default=0),
        ),
    ]