from django.contrib.auth.models import User
from django.db import models

class UserProfile(models.Model):
    # This line is required. Links UserProfile to a User model instance.
    user = models.OneToOneField(User)

    # The additional attributes we wish to include.
    # website = models.URLField(blank=True)
    # picture = models.ImageField(upload_to='static/img/', blank=True)
    city=models.CharField(max_length=50)
    mobile=models.CharField(max_length=50)
    confirmation_code=models.CharField(max_length=500)

    # Override the __unicode__() method to return out something meaningful!
    def __unicode__(self):
        return self.user.username


    
    
    