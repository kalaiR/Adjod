from django.contrib.auth.models import *
from django.db import models
from django.forms import ModelForm
from django.contrib.auth.models import User
from mainlogin.models import *


from thumbnailfield.fields import ThumbnailField
from paypal.standard.ipn.models import PayPalIPN
from paypal.standard.models import ST_PP_COMPLETED
from paypal.standard.ipn.signals import payment_was_successful

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
# start car Module:

# start cars Abstract

class Carbrand(models.Model):
    carbrand=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.carbrand
    
class Carmodel(models.Model):
    carmodel=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.carmodel
    
class Year(models.Model):
    year=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.year

class Color(models.Model):
    color=models.CharField(max_length=50)  
    
    def __unicode__(self):
        return self.color

class Fueltype(models.Model):
    fueltype=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.fueltype

class CarManager(models.Manager):
    def get_query_set(self):
        return (super(CarManager, self).get_query_set()).order_by('-id')

class CarsAbstract(models.Model):
  """
  A Meta Model to store Address information, Address model is always used with
  OneToOne relationship.
  Addresses are used for Actors, Companies, Consumers and stored in different tables to keep seperated.
  """
  model=models.ForeignKey(Carmodel)
  brand = models.ForeignKey(Carbrand)
  year = models.ForeignKey(Year)
  kmsdriven=models.CharField(max_length=10)
  color=models.ForeignKey(Color)
  fueltype=models.ForeignKey(Fueltype)
  
  class Meta:
    abstract = True
    
  def save(self, *args, **kwargs):
    self.clean()
    super(CarsAbstract, self).save(*args, **kwargs)

class Cars(CarsAbstract):
  """
  A Model to store Address information, Address model is always used with OneToOne relationship.
  Addresses are used for Actors, Companies, Consumers and stored in different tables to keep seperated.
  """
  objects = CarManager()

# class CarsManager(models.Manager):
#     def get_query_set(self):
#         return (super(CarsManager, self).get_query_set().order_by('-id'))

# class CarsAbstract(models.Model):
 
#     brand = models.ForeignKey(Carbrand)
#     model=models.ForeignKey(Carmodel)
#     year = models.ForeignKey(Year)
#     kmsdriven=models.CharField(max_length=10)
#     color=models.ForeignKey(Color)
#     fueltype=models.ForeignKey(Fueltype)
    
#     class Meta:
#         abstract = True

#     def save(self, *args, **kwargs):
#         self.clean()
#         super(CarsAbstract, self).save(*args, **kwargs)

# class Cars(CarsAbstract):
#     object= CarsManager()
    
# End cars Abstract

# start Motorcycle Abstract

class Motorbrand(models.Model):
    motorbrand=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.motorbrand
    
class Motormodel(models.Model):
    motormodel=models.CharField(max_length=50)

    def __unicode__(self):
        return self.motormodel
    
class MotorcycleManager(models.Manager):
    def get_motorcycle(self):
        return (super(MotorcycleManager, self).get_motorcycle().order_by(''))

class MotorcycleAbstract(models.Model):
 
    motorcyclebrand = models.ForeignKey(Motorbrand)
    motorcyclemodel=models.ForeignKey(Motormodel)
    year = models.ForeignKey(Year)
    kmsdriven=models.CharField(max_length=10)
    
    
    class Meta:
        abstract = True

class Motorcycle(MotorcycleAbstract):
    objects= MotorcycleManager()
    
# End Motorcycle Abstract

# start Scooter Abstract

class Scooterbrand(models.Model):
    scooterbrand=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.scooterbrand
    
class Scootermodel(models.Model):
    scootermodel=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.scootermodel
    
class ScooterManager(models.Manager):
    def get_scooter(self):
        return (super(ScooterManager, self).get_scooter().order_by(''))

class ScooterAbstract(models.Model):
 
    scooterbrand = models.ForeignKey(Scooterbrand)
    scootermodel=models.ForeignKey(Scootermodel)
    year = models.ForeignKey(Year)
    
    class Meta:
        abstract = True

class Scooter(ScooterAbstract):
    objects= ScooterManager()
    
# End Scooter Abstract

# start Bicycle Abstract

class Bicycletype(models.Model): 
    bicycletype=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.bicycletype
    
class BicycleManager(models.Manager):
    def get_bicycle(self):
        return (super(BicycleManager, self).get_bicycle().order_by(''))

class BicycleAbstract(models.Model):
 
    bicycletype = models.ForeignKey(Bicycletype)
    
    class Meta:
        abstract = True

class Bicycle(BicycleAbstract):
    objects= BicycleManager()
    
# End Bicycle Abstract

# start Sparepart Abstract

class Spare_Producttype(models.Model):
    spare_producttype=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.spare_producttype
    
class SparepartManager(models.Manager):
    def get_sparepart(self):
        return (super(SparepartManager, self).get_sparepart().order_by(''))

class SparepartAbstract(models.Model):
 
    spareproducttype = models.ForeignKey(Spare_Producttype)
    
    class Meta:
        abstract = True

class Sparepart(SparepartAbstract):
    objects= SparepartManager()
    
# End Sparepart Abstract

# start Buses Abstract

class Buses_Vehicletype(models.Model):
    buses_vehicletype=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.buses_vehicletype
    
class BusesManager(models.Manager):
    def get_buses(self):
        return (super(BusesManager, self).get_buses().order_by(''))

class BusesAbstract(models.Model):
 
    busesvehicletype = models.ForeignKey(Buses_Vehicletype)
    
    class Meta:
        abstract = True

class Busespart(BusesAbstract):
    objects= BusesManager()
    
# End Buses Abstract

# start Construction Abstract

class Construction_Vehicletype(models.Model):
    construction_vehicletype=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.construction_vehicletype
    
class ConstructionManager(models.Manager):
    def get_construction(self):
        return (super(ConstructionManager, self).get_construction().order_by(''))

class ConstructionAbstract(models.Model):
 
    constructionvehicletype = models.ForeignKey(Construction_Vehicletype)
    
    class Meta:
        abstract = True

class Construction(ConstructionAbstract):
    objects= ConstructionManager()
    
# End Construction Abstract

# End car Module:

class City(models.Model):
    city=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.city

class Locality(models.Model):
    city_refid=models.ForeignKey(City,null=True)
    locality=models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.locality
    
# start Mobile Module

class Mobilebrand(models.Model):
     mobilebrand = models.CharField(max_length=50,null=True)
     
     def __unicode__(self):
        return self.mobilebrand
     
class Mobilemodel(models.Model):
     mobilemodel = models.CharField(max_length=50,null=True)
    
class Os(models.Model):
     os = models.CharField(max_length=50,null=True)
     
class Sim(models.Model):
     sim = models.CharField(max_length=50,null=True)

class Mobileinclude(models.Model):
     mobileinclude = models.CharField(max_length=50,null=True)
     
class Tabletbrand(models.Model):
     tabletbrand = models.CharField(max_length=50,null=True)
     
class Accesstype(models.Model):
     accesstype = models.CharField(max_length=50,null=True)
     
class Accessbrand(models.Model):
     accessbrand = models.CharField(max_length=50,null=True)

class MobilesManager(models.Manager):
     def get_query_set(self):
        return (super(MobilesManager, self).get_query_set().order_by('mobilebrandname'))

class MobilesAbstract(models.Model):
    mobilebrandname=models.ForeignKey(Mobilebrand)
    mobilemodelname = models.ForeignKey(Mobilemodel)
   
    class Meta:
       abstract = True

class Mobiles(MobilesAbstract):
    objects = MobilesManager()     
     
# End Mobile module
   
class Product(models.Model):
    # user=models.ForeignKey(User, null=True, blank=True)
    user_id=models.IntegerField(null=True, blank=True)
    category = models.ForeignKey(Category, verbose_name='Chosen Category', null=False)
    subcategory =models.ForeignKey(SubCategory,null=False)
    adtype= models.CharField(max_length=10, choices=TYPE)
    title = models.CharField(max_length=250)
    photos = models.ImageField(upload_to='static/img/',null=True)
    thumbnail = models.ImageField(upload_to="static/img/thumbs/", editable=False)

    # def save(self, *args, **kwargs):
    #    super(Product, self).save(*args, **kwargs)
    #    if self.photos:
    #        from PIL import Image as ImageObj
    #        from cStringIO import StringIO
    #        from django.core.files.uploadedfile import SimpleUploadedFile
    #        import os

    #        try:
    #            # thumbnail
    #            THUMBNAIL_SIZE = (160, 160)  # dimensions

    #            image = ImageObj.open(self.photos)

    #            # Convert to RGB if necessary
    #            if image.mode not in ('L', 'RGB'): image = image.convert('RGB')

    #            # create a thumbnail + use antialiasing for a smoother thumbnail
    #            image.thumbnail(THUMBNAIL_SIZE, ImageObj.ANTIALIAS)

    #            # fetch image into memory
    #            temp_handle = StringIO()
    #            image.save(temp_handle, 'png')
    #            temp_handle.seek(0)

    #            # save it
    #            file_name, file_ext = os.path.splitext(self.photos.name.rpartition('/')[-1])
    #            suf = SimpleUploadedFile(file_name + file_ext, temp_handle.read(), content_type='image/png')

    #            self.thumbnail.save(file_name + '.png', suf, save=False)
    #        except ImportError:
    #            pass

    # thumbnail = ThumbnailerImageField(upload_to="static/img/thumbs")
    

    # thumbnail = EnhancedImageField(upload_to='static/img/',null=True,process_source={'size': '200x200',
    #                             'sharpen': True,
    #                             'detail': True,
    #                             'format': 'PNG'},
    #                             thumbnails={'tiny': {'size': '25x25'},
    #                             'thumb': {'size': '85x85',
    #                             'detail': True},
    #                             'half': {'size': '100x100',
    #                             'detail': True,
    #                             'sharpen': True},
    #                             })   
    # thumbnail = EnhancedImageField(upload_to='static/img/',null=True,process_source={'size': '1024x768',
    #                             'sharpen': True,
    #                             'detail': True,
    #                             'format': 'PNG'},
    #                             thumbnails={'tiny': {'size': '25x25'},
    #                             'thumb': {'size': '85x85',
    #                             'detail': True},
    #                             'half': {'size': '512x384',
    #                             'detail': True,
    #                             'sharpen': True},
    #                             })
    # thumbnail = ThumbnailField(('thumbnail'), upload_to='static/img/', null=True, blank=True,
    #     pil_save_options={
    #         # Options of PIL Image.save() method.
    #         # e.g. quality control
    #         'quality': 100,
    #     },
    #     patterns={
    #         # Pattern Format:
    #         #   <Name>: (
    #         #   (<square_size>,),       # with defautl process_method
    #         #   (<width>, <height>,),   # with default process_method
    #         #   (<width>, <height>, <method or method_name>),
    #         #   (<width>, <height>, <method or method_name>, <method options>),
    #         #   )
    #         #
    #         # If Name is ``None`` that mean original image will be processed
    #         # with the pattern
    #         #
    #         # Convert original image to sepia and resize it to 800x400 (original
    #         # size is 804x762)
    #         None: ((None, None, 'sepia'), (800, 400, 'resize')),
    #         # Create 640x480 resized thumbnail as large.
    #         'large': ((640, 480, 'resize'),),
    #         # Create 320x240 cropped thumbnail as small. You can write short
    #         # pattern if the number of appling pattern is 1
    #         'small': (50, 50, 'crop', {'left': 0, 'upper': 0}),
    #         # 'small': (320, 240, 'crop', {'left': 0, 'upper': 0}),
    #         # Create 160x120 thumbnail as tiny (use default process_method to
    #         # generate)
    #         # 'tiny': (160, 120),
    #         'tiny': (50, 50),
    #         #
    #         # These thumbnails are not generated while accessed. These can be
    #         # accessed with the follwoing code::
    #         #
    #         #   entry.thumbnail.large
    #         #   entry.thumbnail.small
    #         #   entry.thumbnail.tiny
    #         #
    #         #   # shortcut properties
    #         #   entry.thumbnail.large_file  # as entry.thumbnail.large.file
    #         #   entry.thumbnail.large_path  # as entry.thumbnail.large.path
    #         #   entry.thumbnail.large_url   # as entry.thumbnail.large.url
    #         #   entry.thumbnail.large.size  # as entry.thumbnail.large.size
    #         #
    #     })
    condition = models.CharField(max_length=10,choices=CONDITION)
    price = models.FloatField(default=0.0)
    
    cars=models.OneToOneField(Cars, null=True, blank=True)
    motorcycle=models.OneToOneField(Motorcycle, null=True, blank=True)
    scooter=models.OneToOneField(Scooter, null=True, blank=True)
    bicycle = models.OneToOneField(Bicycle, null=True, blank=True)
    sparepart = models.OneToOneField(Sparepart, null=True, blank=True)
    busespart=models.OneToOneField(Busespart, null=True, blank=True)
    construction = models.OneToOneField(Construction, null=True, blank=True)
    
    mobile = models.OneToOneField(Mobiles, null=True, blank=True)
    
    city=models.ForeignKey(City)
    locality=models.ForeignKey(Locality)
    description = models.TextField(max_length=100, verbose_name="Description")
    you_are = models.CharField(max_length=20,choices=YOU,default='individual')
    you_name = models.CharField(max_length=20)
    you_email = models.CharField(max_length=30)
    you_phone = models.CharField(max_length=12)

    class Admin:
        pass
  
    def __unicode__(self):
        return self.title

    # def create_thumbnail(self):
    #     # original code for this method came from
    #     # http://snipt.net/danfreak/generate-thumbnails-in-django-with-pil/
         
    #     # If there is no image associated with this.
    #     # do not create thumbnail
    #     if not self.image:
    #         return
         
    #     from PIL import Image
    #     from cStringIO import StringIO
    #     from django.core.files.uploadedfile import SimpleUploadedFile
    #     import os
         
    #     # Set our max thumbnail size in a tuple (max width, max height)
    #     THUMBNAIL_SIZE = (50,50)
         
    #     DJANGO_TYPE = self.image.file.content_type
         
    #     if DJANGO_TYPE == 'image/jpeg':
    #         PIL_TYPE = 'jpeg'
    #         FILE_EXTENSION = 'jpg'
    #     elif DJANGO_TYPE == 'image/png':
    #         PIL_TYPE = 'png'
    #         FILE_EXTENSION = 'png'
         
    #     # Open original photo which we want to thumbnail using PIL's Image
    #     image = Image.open(StringIO(self.image.read()))
         
    #     # Convert to RGB if necessary
    #     # Thanks to Limodou on DjangoSnippets.org
    #     # http://www.djangosnippets.org/snippets/20/
    #     #
    #     # I commented this part since it messes up my png files
    #     #
    #     #if image.mode not in ('L', 'RGB'):
    #     # image = image.convert('RGB')
         
    #     # We use our PIL Image object to create the thumbnail, which already
    #     # has a thumbnail() convenience method that contrains proportions.
    #     # Additionally, we use Image.ANTIALIAS to make the image look better.
    #     # Without antialiasing the image pattern artifacts may result.
    #     image.thumbnail(THUMBNAIL_SIZE, Image.ANTIALIAS)
         
    #     # Save the thumbnail
    #     temp_handle = StringIO()
    #     image.save(temp_handle, PIL_TYPE)
    #     temp_handle.seek(0)
         
    #     # Save image to a SimpleUploadedFile which can be saved into
    #     # ImageField
    #     suf = SimpleUploadedFile(os.path.split(self.image.name)[-1],
    #     temp_handle.read(), content_type=DJANGO_TYPE)
    #     # Save SimpleUploadedFile into image field
    #     self.thumbnail.save('%s_thumbnail.%s'%(os.path.splitext(suf.name)[0],FILE_EXTENSION), suf, save=False)
         
    #     def save(self):
    #     # create a thumbnail
    #         self.create_thumbnail()
             
    #         super(Product, self).save()     
 
# class ProductForm(ModelForm):
#     class Meta:
#         model = Product
        
# class Note(models.Model):
#     title = models.CharField(max_length=1000)
#     body = models.TextField()
#     timestamp = models.DateTimeField(auto_now=True)

#     def __unicode__(self):
#         return self.title

# class Productsearch(models.Model):
#     title = models.CharField(max_length=1000)
#     price = models.FloatField(default=0.0)
#     created_at = models.DateTimeField(auto_now=True)
    

#     def __unicode__(self):
#         return self.title

# models.py
