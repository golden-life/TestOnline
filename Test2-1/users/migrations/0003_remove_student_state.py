# Generated by Django 3.0.4 on 2020-05-11 16:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20200511_1517'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='student',
            name='state',
        ),
    ]
