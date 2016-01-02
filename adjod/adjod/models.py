from django.contrib.auth.models import User
from django.db import models
from advertisement.models import *
from django.utils.translation import ugettext_lazy as _

LANGUAGE = (
    ('en', 'English'),
    ('zh', 'Chinese'),
    ('ms', 'Malay'),
)


#Model for storing user personal details
class UserProfile(User):
    mobile=models.CharField(max_length=50, null=True)
    confirmation_code=models.CharField(max_length=500)
    city=models.ForeignKey('advertisement.City', null=True, blank=True)
    language=models.CharField(max_length=5,choices=LANGUAGE,default='en')
    age_status=models.BooleanField(default=False)
    is_emailverified=models.BooleanField(default=False)
    ad_count=models.IntegerField(max_length=5, null=True, blank=True, default=0)
    is_subscribed=models.BooleanField(default=False)
    subscribed_plan = models.ForeignKey('advertisement.PremiumPriceInfo', null=True, blank=True)

    # Override the __unicode__() method to return out something meaningful!
    def __unicode__(self):
        return self.username

class ExchangeRate(models.Model):
    currency = models.CharField(max_length=3)
    value = models.DecimalField(max_digits=20, decimal_places=6)

    def __str__(self):
        return _("%s at %.6f") % (self.currency, self.value)

class BaseCurrency(models.Model):
    base_currency = models.CharField(max_length=3)
    last_update = models.DateTimeField(auto_now=True)

    def __str__(self):
        return _("%s rates update %s") % (
            self.base_currency, self.last_update)
