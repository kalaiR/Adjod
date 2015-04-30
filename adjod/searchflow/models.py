# from django.contrib.auth.models import *
# from django.db import models
# from django.forms import ModelForm
# from django.contrib.auth.models import User
# from adjod.models import *
# import datetime
# from django import template

# # TYPE = (
# #     ('buy', 'Buy'),
# #     ('sell', 'Sell'),
   
# # )

# # CONDITION = (
# #     ('used', 'Used'),
# #     ('new', 'New'),
   
# # )

# # YOU=( ('individual','Individual'),('dealer','Dealer'))    


# # class Category(models.Model):
# #     icon = models.ImageField(upload_to='static/img/', blank=True)
    
# #     name = models.CharField(max_length=250)
# #     category_type = models.CharField(max_length=250)
    
# #     def __unicode__(self):
# #         return self.name

# # class SubCategory(models.Model):
# #     category = models.ForeignKey(Category) 
# #     name = models.CharField(max_length=50) 
    
    
# #     def __unicode__(self):
# #         return self.name        
        
# # class Dropdown(models.Model):
    
# #     subcat_refid=models.ForeignKey(SubCategory, null=True, blank=True)
# #     brand_name=models.CharField(max_length=50, blank =True,default='')
# #     brand_refid=models.ForeignKey('self', blank=True, null=True)

# #     model_name=models.CharField(max_length=50, blank =True, default='')

# #     type_name=models.CharField(max_length=50, blank =True, default='')
# #     year=models.CharField(max_length=50, blank =True,default='')
# #     color=models.CharField(max_length=50, blank =True,default='')
# #     os=models.CharField(max_length=50, blank =True,default='')
# #     sim=models.CharField(max_length=50, blank =True,default='')
# #     alsoinclude=models.CharField(max_length=50, blank =True,default='')

# #     def __unicode__(self):
# #         return self.brand_name

# # class City(models.Model):
# #     city=models.CharField(max_length=50)
    
# #     def __unicode__(self):
# #         return self.city

# # class Locality(models.Model):
# #     city_refid=models.ForeignKey(City,null=True)
# #     locality=models.CharField(max_length=50)
    
# #     def __unicode__(self):
# #         return self.locality

# # class Product(models.Model):
# #     #user=models.ForeignKey(User, null=True, blank=True)
# #     user_id=models.IntegerField(null=True, blank=True)
# #     category = models.ForeignKey(Category, verbose_name='Chosen Category', null=False)
# #     subcategory =models.ForeignKey(SubCategory,null=False)
# #     adtype= models.CharField(max_length=10, choices=TYPE)
# #     title = models.CharField(max_length=250)
# #     photos = models.ImageField(upload_to='static/img/photos/',null=True)
# #     thumbnail = models.ImageField(upload_to="static/img/thumbs/", editable=False)
    
# #     condition = models.CharField(max_length=10,choices=CONDITION)
# #     price = models.FloatField(default=0.0)
# #     ad_type=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_type")
# #     ad_brand=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_brand")
# #     ad_model=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_model")
    
# #     ad_year=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_year")
# #     ad_color=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_color")
# #     ad_kmsdriven=models.CharField(max_length=50, null=True, blank=True)
# #     ad_os=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_os")
# #     ad_sim=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_sim")
# #     ad_alsoinclude=models.ForeignKey(Dropdown,null=True, blank=True, related_name="ad_alsoinclude")
    
# #     city=models.ForeignKey(City)
# #     locality=models.ForeignKey(Locality)
# #     description = models.TextField(max_length=100, verbose_name="Description")
# #     you_are = models.CharField(max_length=20,choices=YOU,default='individual')
# #     you_name = models.CharField(max_length=20)
# #     you_email = models.CharField(max_length=30)
# #     you_phone = models.CharField(max_length=12)
# #     created_date =models.DateField(default=datetime.datetime.now)
# #     modified_date =models.DateField(default=datetime.datetime.now)
# #     imagecount=models.IntegerField(null=True, blank=True)

# #     class Admin:
# #         pass
  
# #     def __unicode__(self):
# #         return self.title

   
#     # @classmethod
#     # def get_subcategory(cls, subid):
#     #     data=Dropdown.objects.filter(subcat_refid=subid)
#     #     for datas in data:
#     #         print datas.subcat_refid
#     #         field_dict={}
#     #         for datas in data:
#     #             field_dict[datas.subcat_refid] = {"brand":datas.brand_name, "model": datas.model_name}
#     #             print field_dict[datas.subcat_refid]
                    


#     #                 field_dict[datas.subcat_refid] = datas.brand_name
#     #                 print field_dict[datas.subcat_refid]
#     #         field_dict={
#     #             "cars": "datas.brand_name,datas.brand_model",
#     #             }
#     #         print field_dict.cars.datas.brand_name

#     # @register.filter()
#     # def get_photos(photo):
#     #     print "get_photos"
#     #     photo=str(photo).split(',')
#     #     return photo[0]
 
#     # Rebuild connections:
    
#     # def save(self, force_insert=False, force_update=False):
#     #     l_search = self.search_leads()
#     #     self.index_search()   

#     # def get_search_params(self, override_params=None):

#     #     _params = OrderedDict(
#     #         locality = None,
#     #         subcategoryid = None,      
#     #         category = self.category,      
#     #     )

#     #     params = OrderedDict()
#     #     for k, v in _params.iteritems():
#     #       if not v:
#     #         v = None

#     #       params[k] = v

#     #     # if self.locality:
#     #     #   loc = self.locality.split(',')
#     #     #   params['locality'] = loc


#     #     orderby_mappings = {
#     #       'createddate': '-created',
#     #       'modifieddate': '-modified',
#     #       'pricelow': 'base_price',
#     #       'pricehigh': '-base_price'
#     #     }

#     #     if override_params is not None:
#     #       _q, _params, _orderby, _geo_location, _geo_params = override_params

#     #       # orderby = _orderby or orderby
#     #       # geo_location = _geo_location or geo_location
#     #       # geo_params = _geo_params or geo_params

#     #       for k, v in _params.iteritems():
#     #         params[k] = v

#     #     return (params)


#     # def search_leads(self, override_params=None):
#     #     params = self.get_search_params(override_params)
#     #     #q = self.search_text()
#     #     if override_params:
#     #         q = override_params[0]
#     #     return productsearch(q, params, orderby, groupby, model_cls=self.get_model_class(), 
#     #     default_filters=self.get_default_filters(), default_search_field=self.get_default_search_field())


#     # def index_search(self):
#     #     query = self.search_leads()
#     #     return query.query.percolator('leadfilter-' + str(self.pk))          

