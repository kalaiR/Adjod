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

YOU=( ('individual','Individual'),('dealer','Dealer'))

class Category(models.Model):
    # icon = models.ImageField(upload_to='static/img/', blank=True)
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
    brand_name=models.CharField(max_length=50, blank =True,default='')
    # brand_refid=models.ForeignKey('self', blank=True, null=True)
    # model_name=models.CharField(max_length=50, blank =True, default='')
    # type_name=models.CharField(max_length=50, blank =True, default='')
    # year=models.CharField(max_length=50, blank =True,default='')
    # color=models.CharField(max_length=50, blank =True,default='')
    # os=models.CharField(max_length=50, blank =True,default='')
    # sim=models.CharField(max_length=50, blank =True,default='')
    # alsoinclude=models.CharField(max_length=50, blank =True,default='')
    def __unicode__(self):
        return self.brand_name

# class Brand(models.Model):
#     brand_name= models.CharField(max_length=50)
#     brand_subcategory=models.ManyToManyField(SubCategory)
#     model_name

#     def __unicode__(self):
#         return self.brand_name

# class Country(models.Model):
#     code=models.CharField(max_length=50)
#     country=models.CharField(max_length=50)
#     def __unicode__(self):
#         return self.code

class City(models.Model):
    city=models.CharField(max_length=50)
    # country=models.ForeignKey(Country)
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
    currency=models.CharField(max_length=10)
    purpose=models.CharField(max_length=30)
    month=models.IntegerField(null=True, blank=True)
    def __unicode__(self):
        return self.purpose

class Product(models.Model):
    userprofile=models.ForeignKey(UserProfile, null=True, blank=True)
    # user_id=models.IntegerField(null=True, blank=True)
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
    description = models.TextField(max_length=100, verbose_name="Description", null=False)
    you_are = models.CharField(max_length=20,choices=YOU,default='individual', null=False)
    you_name = models.CharField(max_length=20, null=True)
    you_email = models.CharField(max_length=30, null=False)
    you_phone = models.CharField(max_length=12, null=True)
    created_date =models.DateField(default=datetime.datetime.now)
    modified_date =models.DateField(default=datetime.datetime.now)
    isregistered_user=models.BooleanField(default=False)
    # ispremium=models.BooleanField(default=False)
    ispremium=models.CharField(max_length=12, null=False)
    premium_plan=models.ForeignKey(PremiumPriceInfo, null=True, blank=True)
    expired_date=models.DateField(null=True,blank=True)
    status_isactive=models.BooleanField(default=False)
    # country=models.ForeignKey(Country, null=True, blank=True)
    country_code=models.CharField(max_length=10)
    post_terms=models.BooleanField(default=False)
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

class Transaction(models.Model):

  """
  Transaction handles all transactions in the system
    1 Order * from Buyer
    2 Deposit * from Actor
    3 Payout * to Actor
    4 Voucher * from Actor
    5 Sales * to Seller
    6 Commission * to Fixido
    7. Kickback * to Partner
  """
  def create_transaction_reference():
      try:
          return 'AO' + str(int(Transaction.objects.filter(reference__startswith='AO').latest('reference').reference[2:]) + 1)
      except:
          return 'AO20001001'

  def create_transaction_id():
      try:
          return int(Transaction.objects.latest('transaction_id').transaction_id) + 1
      except:
          return 1

  #TODO WRITE CODE TO UPDATE THE USER ACCOUNT WITH EVERY TRANSACTION!!! = UPDATE THE ACTOR ACCOUNT BALANCE!!!
  transaction_id = models.IntegerField(default=create_transaction_id, null=False, editable=True, help_text="Internal transaction id. Used for identification")
  reference = models.CharField(max_length=128, primary_key=True, default=create_transaction_reference, editable=True, help_text="Internal transaction reference. Used for identification")
  userprofile = models.ForeignKey(UserProfile)

  amount = models.DecimalField(default=0.0, max_digits=10, decimal_places=2, help_text="Total paid amount including TAX")
  currency = models.CharField(max_length=8, default=settings.BASE_CURRENCY, null=True, blank=True, help_text="Payment currency. Stored as ISO codes (SEK, EUR, etc) in the DB")

  payment_method = models.CharField(max_length=128, null=True, blank=True, help_text="Refer to the payment method.")
  payment_reference = models.CharField(max_length=128, null=True, blank=True, help_text="Refer to a payment. Can be payment gateway transaction id.")
  payment_message = models.CharField(max_length=256, null=True, blank=True, help_text="Message from payment system. Can be used for payment status and error messages.")

  # transaction_type = models.CharField(max_length=15, choices=TRANSACTION_TYPE, help_text="Type of the transaction. Handle by system.")
  # transaction_flag = models.CharField(max_length=10, choices=TRANSACTION_FLAG, help_text="Flag of the transaction. Handle by system.")

  # order = models.ForeignKey(Order, null=True, blank=True)
  # invoice = models.ForeignKey(Invoice, null=True, blank=True)

  UserIp = models.CharField(max_length=100, null=True, blank=True, help_text="stores user ip.")
  #TODO> PAYMENT WITH VOUCHER voucher

  #TODO> PAYMENT WITH ACCOUNT. IN FUTURE USER CAN HAVE MULTIPLE ACCOUNTS TO PAY. FOR EXAMPLE A RESELLER.

  #TODO> COPY THIS FUNCTION TO ACTOR AS WELL TO MAKE INTERNAL NOTES ON ACTORS!!
  # admin_note = models.TextField(null=True, blank=True, help_text="Admin user can add a manual note")
  admin_note_created = models.DateTimeField(auto_now_add=True, null=True, blank=True, help_text="Auto generated by system.")
  admin_note_modified = models.DateTimeField(auto_now_add=True, auto_now=True, null=True, blank=True, help_text="Auto generated by system.")
  admin_note_user = models.CharField(max_length=24, null=True, blank=True, help_text="Tells what admin user made the note.")

  payment_date = models.DateTimeField(auto_now_add=True, null=True, blank=True, help_text="Payment date.")
  transaction_date = models.DateTimeField(auto_now_add=True, null=True, blank=True, help_text="Transaction date.")

  base_amount = models.DecimalField(default=0.0, decimal_places=2, blank=True,
    max_digits=10)
  base_currency = models.CharField(default=settings.BASE_CURRENCY, blank=True,
    max_length=6)
  base_exchange_rate = models.DecimalField(default=1, decimal_places=4,
    blank=True, max_digits=10)


  created = models.DateTimeField(auto_now_add=True, help_text="Auto generated by system.")
  transaction_date.editable=True
  modified = models.DateTimeField(auto_now_add=True, auto_now=True, help_text="Auto generated by system.")
  #TODO TRACE IP ADDRESSES AND MORE TO MAKE SURE IT SECURE.

  @classmethod
  def new_transaction_id(cls, prefix):
    try:
      return prefix + str(
        int(
          Transaction.objects.filter(
            reference__startswith=prefix).order_by(
            '-reference')[0].reference[2:]
          ) + 1)

    except Exception, e:
      return prefix+'20001001'

  def save(self, *args, **kwargs):

    if not self.base_amount or \
      not self.base_exchange_rate or \
      not self.base_currency:

      tbc = CurrencyExchangeRate.ToBaseCurrency
      amount, exchange_rate = tbc(self.amount, self.currency)

      self.base_amount = amount
      self.base_exchange_rate = exchange_rate
      self.base_currency = CurrencyExchangeRate.BaseCurrency()

    super(Transaction, self).save(*args, **kwargs)

  def __unicode__(self):
    return str(self.reference)
