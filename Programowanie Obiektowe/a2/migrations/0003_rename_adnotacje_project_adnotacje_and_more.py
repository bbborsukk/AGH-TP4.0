# Generated by Django 4.2 on 2023-06-30 16:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('a2', '0002_rename_adnotacje_project_adnotacje_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='project',
            old_name='Adnotacje',
            new_name='adnotacje',
        ),
        migrations.RenameField(
            model_name='project',
            old_name='Opis',
            new_name='opis',
        ),
        migrations.RenameField(
            model_name='project',
            old_name='Tytul',
            new_name='tytul',
        ),
    ]
