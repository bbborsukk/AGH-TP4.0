from django.db import models

# Create your models here.
class Project(models.Model):
    tytul = models.CharField(max_length=200)
    opis = models.TextField()
    adnotacje = models.TextField()

    def __str__(self):
        return self.tytul