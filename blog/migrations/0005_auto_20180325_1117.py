# Generated by Django 2.0.3 on 2018-03-25 03:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_remove_tag_tag_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='article',
            field=models.ForeignKey(on_delete=False, to='blog.Article'),
        ),
    ]
