from django.db import models
POSITION = (
    ('top', 'Top'),
    ('bottom', 'Bottom'),
    ('left', 'Left'),
    ('right', 'Right'), 
    ('bleft', 'Background-left'),
    ('bright', 'Background-right'),
)

class SiteBanner( models.Model ):
   banner = models.FileField(upload_to = 'banners', null=True, blank=True)
   link= models.CharField(max_length=200, null=True, blank=True)
   pageurl= models.CharField(max_length=50, null=True, blank=True)
   position=models.CharField(max_length=50, null=True, blank=True, choices=POSITION)
   def __unicode__(self):
    return self.link
