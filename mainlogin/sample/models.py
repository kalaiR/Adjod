
from django.db import models

# Create your models here.

BRAND = (
    ('1', 'Select Type'),
    ('2', 'Vodafone'),
    ('3', 'Samsung'),
    ('4', 'LG'),
    ('5', 'Nokia'),
    ('6', 'Alcatel'),
    
)

YEAR = (
    ('1', '2000'),
    ('2', '2001'),
    ('3', '2002'),
    ('4', '2003'),
    ('5', '2004'),
    ('6', '2005'),
    ('7', '2006'),
    ('8', '2007'),
    ('9', '2008'),
    ('10', '2009'),
    ('11', '2010'),
    ('12', '2011'),
    ('13', '2012'),
    ('14', '2013'),
    ('15', '2014'),
    ('16', 'Before 2000'), 
    
)

class CallsManager(models.Manager):
    def get_calls(self):
        return (super(CallsManager, self).get_calls().order_by(''))

class CallsAbstract(models.Model):
 
    brand = models.CharField(max_length=100,choices=BRAND)
    year = models.CharField(max_length=4,choices=YEAR)
  
    class Meta:
        abstract = True
    def __unicode__(self):
        return self.brand

class Calls(CallsAbstract):
    object= CallsManager()

class First(models.Model):
    name=models.CharField(max_length=10)
    callfields=models.OneToOneField(Calls,null=False)



