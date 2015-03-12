
from django.db import models

# Create your models here.


class Cat(models.Model):
    c_icon = models.ImageField(upload_to='static/img/', blank=True)
    
    c_name = models.CharField(max_length=250)
    c_category_type = models.CharField(max_length=250)
    
    def __unicode__(self):
        return self.c_name

class SubCat(models.Model):
    sc_category = models.ForeignKey(Cat) 
    sc_name = models.CharField(max_length=50) 
    
    
    def __unicode__(self):
        return self.sc_name

class Dropdown(models.Model):
    
    dg_subcat_refid=models.ForeignKey(SubCat,null=True, blank=True)
    dg_brand=models.CharField(max_length=50, null=True, blank =True)
    dg_brand_refid=models.ForeignKey('self',null=True, blank=True)

    dg_model=models.CharField(max_length=50, null=True, blank =True)

    dg_type_name=models.CharField(max_length=50, null=True, blank =True)
    dg_year=models.CharField(max_length=50, null=True, blank =True)
    dg_color=models.CharField(max_length=50, null=True, blank =True)
    dg_os=models.CharField(max_length=50, null=True, blank =True)
    dg_sim=models.CharField(max_length=50, null=True, blank =True)
    dg_alsoinclude=models.CharField(max_length=50, null=True, blank =True)



    def __unicode__(self):
        return self.dg_brand