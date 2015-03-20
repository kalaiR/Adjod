from django.contrib.auth.models import *
from django.db import models
from django.forms import ModelForm
from django.contrib.auth.models import User
from mainlogin.models import *


from thumbnailfield.fields import ThumbnailField
from paypal.standard.ipn.models import PayPalIPN
from paypal.standard.models import ST_PP_COMPLETED
from paypal.standard.ipn.signals import payment_was_successful
import datetime

# from thumbnail_works.fields import EnhancedImageField

# from easy_thumbnails.fields import ThumbnailerImageField
TYPE = (
    ('buy', 'Buy'),
    ('sell', 'Sell'),
   
)

CONDITION = (
    ('used', 'Used'),
    ('new', 'New'),
   
)

YOU=( ('individual','Individual'),('dealer','Dealer'))

def show_me_the_money(sender, **kwargs):
    ipn_obj = sender
    # You need to check 'payment_status' of the IPN

    if ipn_obj.payment_status == "Completed":
        # Undertake some action depending upon `ipn_obj`.
        if ipn_obj.custom == "Upgrade all users!":
            Users.objects.update(paid=True)
    

payment_was_successful.connect(show_me_the_money)

    
class Category(models.Model):
    icon = models.ImageField(upload_to='static/img/', blank=True)
    
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
    
    subcat_refid=models.ForeignKey(SubCategory, null=True, blank=True)
    brand_name=models.CharField(max_length=50, blank =True,default='')
    brand_refid=models.ForeignKey('self', blank=True, null=True)

    model_name=models.CharField(max_length=50, blank =True, default='')

    type_name=models.CharField(max_length=50, blank =True, default='')
    year=models.CharField(max_length=50, blank =True,default='')
    color=models.CharField(max_length=50, blank =True,default='')
    os=models.CharField(max_length=50, blank =True,default='')
    sim=models.CharField(max_length=50, blank =True,default='')
    alsoinclude=models.CharField(max_length=50, blank =True,default='')

    def __unicode__(self):
        return self.brand_name

   




class City(models.Model):
    city=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.city

class Locality(models.Model):
    city_refid=models.ForeignKey(City,null=True)
    locality=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.locality

   
class Product(models.Model):
    # user=models.ForeignKey(User, null=True, blank=True)
    user_id=models.IntegerField(null=True, blank=True)
    category = models.ForeignKey(Category, verbose_name='Chosen Category', null=False)
    subcategory =models.ForeignKey(SubCategory,null=False)
    adtype= models.CharField(max_length=10, choices=TYPE)
    title = models.CharField(max_length=250)
    photos = models.ImageField(upload_to='static/img/photos/',null=True)
    thumbnail = models.ImageField(upload_to="static/img/thumbs/", editable=False)
    
    condition = models.CharField(max_length=10,choices=CONDITION)
    price = models.FloatField(default=0.0)
    ad_type=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_type")
    ad_brand=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_brand")
    ad_model=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_model")
    
    ad_year=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_year")
    ad_color=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_color")
    ad_kmsdriven=models.CharField(max_length=50, null=True, blank=True)
    ad_os=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_os")
    ad_sim=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_sim")
    ad_alsoinclude=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_alsoinclude")
    
    city=models.ForeignKey(City)
    locality=models.ForeignKey(Locality)
    description = models.TextField(max_length=100, verbose_name="Description")
    you_are = models.CharField(max_length=20,choices=YOU,default='individual')
    you_name = models.CharField(max_length=20)
    you_email = models.CharField(max_length=30)
    you_phone = models.CharField(max_length=12)
    created_date =models.DateTimeField(default=datetime.datetime.now)
    modified_date =models.DateTimeField(default=datetime.datetime.now)

    class Admin:
        pass
  
    def __unicode__(self):
        return self.title

    @classmethod
    def get_subcategory(cls, subid):
        data=Dropdown.objects.filter(subcat_refid=subid)
        for datas in data:
            print datas.subcat_refid
            field_dict={}
            for datas in data:
                field_dict[datas.subcat_refid] = {"brand":datas.brand_name, "model": datas.model_name}
                print field_dict[datas.subcat_refid]
                    


                    # field_dict[datas.subcat_refid] = datas.brand_name
                    # print field_dict[datas.subcat_refid]
            # field_dict={
            #     "cars": "datas.brand_name,datas.brand_model",
            #     }
            # print field_dict.cars.datas.brand_name

        