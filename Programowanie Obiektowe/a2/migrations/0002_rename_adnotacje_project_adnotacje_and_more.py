# Generated by Django 4.2 on 2023-06-30 16:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('a2', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='project',
            old_name='adnotacje',
            new_name='Adnotacje',
        ),
        migrations.RenameField(
            model_name='project',
            old_name='opis',
            new_name='Opis',
        ),
        migrations.RenameField(
            model_name='project',
            old_name='tytul',
            new_name='Tytul',
        ),
    ]
