from django.db import models

# Create your models here.


POSITION = (
    ('top', 'Top'),
    ('bottom', 'Bottom'),
    ('left', 'Left'),
    ('right', 'Right'),   
)

class SiteBanner( models.Model ):
   banner = models.FileField(upload_to = 'static/banners/', null=True, blank=True)
   link= models.CharField(max_length=200, null=True, blank=True)
   pageurl= models.CharField(max_length=50, null=True, blank=True)
   position=models.CharField(max_length=50, null=True, blank=True, choices=POSITION)

   def __unicode__(self):
    return self.link
