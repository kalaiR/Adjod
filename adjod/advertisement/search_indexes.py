import datetime

from haystack.indexes import *

# from haystack.sites import *

from models import Product

from models import *

# from core.config import COUNTRIES_DICT

from django.db.models import F

from adjod.search_sites import *

from django.contrib.auth.models import User
from advertisement.models import *
from haystack.management.commands import update_index

 
# from control.models import *

# from actors.models import *

# from commerce.models import *


class ProductIndex(SearchIndex, Indexable):
    
    text = CharField(document=True, use_template=True)
    searchtext = CharField()
    title = CharField(model_attr='title')
    description = CharField(model_attr='description')
    price = FloatField(model_attr='price')
    #locality = MultiValueField(null=True)
    # keywords = MultiValueField(null=True)
    # category = CharField(model_attr='category', null=True)
    category = CharField(model_attr='category__id')
    brandtype = CharField(model_attr='ad_brand__id')
    locality = CharField(model_attr='locality__id')
    subcategoryid = CharField(model_attr='subcategory__id') 
    created_date = DateTimeField(model_attr='created_date')
    modified_date = DateTimeField(model_attr='modified_date') 
    # geolocation = LocationField(model_attr='get_geolocation', null=True)
    city = CharField(null=True, faceted=True)

    def autoUpdateRebuild_index(self):
        update_index.Command().handle()
        rebuild_index.Command().handle()


    def prepare_searchtext(self, obj):
        text = []
        if obj.title:
            text.append(obj.title)

        if obj.description:
            text.append(obj.description)

        text += self.prepare_locations(obj)

        search = []
        for t in text:
            t = re.sub(r'[^\w]', ' ', t, flags=re.UNICODE).split(' ')
            for q in t:
                if q and (not re.match(r'[^\w]', q, flags=re.UNICODE)):
                    search.append(q)

        return ' '.join(search)
    
 


    def prepare_locations(self, obj):

      locality = []

      city = obj.city_id

      return locality

#    def extra_context(request):
#        if  request.user.is_authenticated():
#            signupbonus = Transaction.objects.filter(actor=int(request.user.id), transaction_type="deposit").count()
#            if signupbonus == 0:
#               signupbonus = 0          
#            return {"signupbonus":signupbonus}
    
    def get_model(self):
        return Product

    def index_queryset(self, **kwargs):

        product = Product.objects.all().order_by('-modified_date')
        return product

    

# register_model_for_search(Lead, LeadIndex)
 

