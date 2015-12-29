from django.contrib.auth.models import *
from django.db import models
from django.forms import ModelForm
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from haystack.query import SearchQuerySet
import datetime
from adjod.models import *

from paypal.standard.ipn.models import PayPalIPN
from paypal.standard.models import ST_PP_COMPLETED
from paypal.standard.ipn.signals import payment_was_successful
from django.conf import settings

TYPE = (
    ('buy', 'Buy'),
    ('sell', 'Sell'),
)

CONDITION = (
    ('used', 'Used'),
    ('new', 'New'),
)
SUBSCRIPTION_TYPE = (
    ('account_subscription', 'Account Subscription'),
    ('product_subscription', 'Product Subscription'),
)


YOU=( ('individual','Individual'),('dealer','Dealer'))

class Category(models.Model):
    icon = models.ImageField(upload_to='icons', blank=True)
    name = models.CharField(max_length=250)
    category_type = models.CharField(max_length=250)
    def __unicode__(self):
        return self.name

class SubCategory(models.Model):
    category = models.ForeignKey(Category)
    name = models.CharField(max_length=50)
    def __unicode__(self):
        return self.name

class Dropdown(models.Model):
    subcat=models.ManyToManyField(SubCategory, null=True, blank=True)
    brand_name=models.CharField(max_length=50, blank =True, default='')
    def __unicode__(self):
        return self.brand_name

class City(models.Model):
    city=models.CharField(max_length=50)
    country_code=models.CharField(max_length=10)
    country_name=models.CharField(max_length=50)
    def __unicode__(self):
        return self.city

class Locality(models.Model):
    city_refid=models.ForeignKey(City,null=True)
    locality=models.CharField(max_length=50)
    def __unicode__(self):
        return self.locality

class PremiumPriceInfo(models.Model):
    premium_price = models.FloatField(null=True, default=0.0)
    base_currency = models.CharField(default=settings.BASE_CURRENCY, blank=True,
                    max_length=6)   
    purpose= models.CharField(max_length=30, choices=SUBSCRIPTION_TYPE)
    duration=models.BigIntegerField(
        null=True, blank=True, help_text="No of days allowed")
    def __unicode__(self):
        return self.purpose

class Product(models.Model):
    userprofile=models.ForeignKey(UserProfile, null=True, blank=True)
    category = models.ForeignKey(Category, verbose_name='Chosen Category', null=False)
    subcategory =models.ForeignKey(SubCategory,null=False)
    adtype= models.CharField(max_length=10, choices=TYPE, null=False)
    title = models.CharField(max_length=250, null=False)
    photos = models.ImageField(upload_to='products',null=True, max_length=500)
    thumbnail = models.ImageField(upload_to="product_thumbs", null=True, editable=False, max_length=500)
    imagecount=models.IntegerField(null=True, blank=True)
    video=models.FileField(upload_to='videos',null=True, blank=True)
    condition = models.CharField(max_length=10,choices=CONDITION, default="used")
    price = models.FloatField(null=True, default=0.0)
    ad_brand=models.ForeignKey(Dropdown,null=True, related_name="ad_brand")
    ad_year=models.CharField(max_length=10, null=True)
    city=models.ForeignKey(City, null=False)
    locality=models.ForeignKey(Locality, null=False)
    country_code=models.CharField(max_length=10)
    description = models.TextField(max_length=100, verbose_name="Description", null=False)
    you_are = models.CharField(max_length=20,choices=YOU,default='individual', null=False)
    you_name = models.CharField(max_length=20, null=True)
    you_email = models.CharField(max_length=30, null=False)
    you_phone = models.CharField(max_length=12, null=True)
    created_date =models.DateField(default=datetime.datetime.now)
    modified_date =models.DateField(default=datetime.datetime.now)
    isregistered_user=models.BooleanField(default=False)
    ispremium=models.BooleanField(default=False)
    premium_plan=models.ForeignKey(PremiumPriceInfo, null=True, blank=True)
    expired_date=models.DateField(null=True,blank=True)
    status_isactive=models.BooleanField(default=False)
    post_term_status=models.BooleanField(default=False)
    class Admin:
        pass
    def __unicode__(self):
        return self.title

    @classmethod
    def get_related(cls,product):
        if product.ad_brand:
          qs =  SearchQuerySet().filter(subcategoryid=product.subcategory.id, adbrandid=product.ad_brand.id).exclude(id=product.id)
        else:
          qs =  SearchQuerySet().filter(subcategoryid=product.subcategory.id).exclude(id=product.id)
        print "qs", qs
        related_product=[]
        for product in qs:
            if product.object:
                related_product.append(product)
                print "related_product",related_product
        if not related_product:
          qs =  SearchQuerySet().all().exclude(id=product.id)
          related_product=qs
        return related_product

class FreeAlert(models.Model):
    alert_user=models.ForeignKey(UserProfile,null=True)
    alert_category = models.ForeignKey(Category, verbose_name='Chosen Category', null=False)
    alert_subcategory =models.ForeignKey(SubCategory,null=False)
    alert_brand=models.ForeignKey(Dropdown,null=False)
    alert_city=models.ForeignKey(City, null=False)
    alert_locality=models.ForeignKey(Locality, null=False)
    alert_email=models.CharField(max_length=30, null=False)
    alert_mobile=models.CharField(max_length=30, null=False)
    mail_is_sent=models.BooleanField(default=False)
    last_email_sent = models.DateTimeField(null=True)
    def __unicode__(self):
        return self.alert_email

    def get_matching_filters(cls, product):
        qs = FreeAlert.objects.filter(product=product)
        print "qs", qs
        return qs

