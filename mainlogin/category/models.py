

from django.contrib.auth.models import *
from django.db import models


# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=50) 

class SubCategory(models.Model):
    category = models.ForeignKey(Category)
    name = models.CharField(max_length=50)