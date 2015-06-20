import re
from django import forms
from collections import OrderedDict
from advertisement.models import *
from haystack.forms import SearchForm, FacetedSearchForm
from datetime import datetime
from django.http import HttpResponse, Http404
from search.searchresults import searchresults as productsearch
from haystack.query import SearchQuerySet
from haystack.inputs import Clean, Raw, AutoQuery, Exact
from haystack.query import SQ
from advertisement.models import Product

class Partial(Clean):
    input_type_name = 'partial'
    post_process = True

    def __init__(self, query_string, **kwargs):
        self.original = query_string
        super(Partial, self).__init__(query_string, **kwargs)

    def prepare(self, query_obj):
        query_string = super(Partial, self).prepare(query_obj)
        query_string = query_string.lower()
        query_string = re.sub( '\s+', '* ', query_string).strip()

        if query_string[-1] != '*':
          query_string = query_string + u'*'

        print "Searching", self.original, query_string
        return 

class ProductSearchFilter(FacetedSearchForm):
    print 'LeadSearchFilter'
    #Code included by Ramu
    model = None

    # def __init__ (self,request=None, using=None):
    #     from models import Lead
    #     self.model= Lead#kwargs.pop('models')        
    #     super(LeadSearchFilter,self).__init__(request, using=using, **kwargs)

    price_start = forms.FloatField(required=False)
    price_end = forms.FloatField(required=False)
    locality    = forms.CharField(required=False)
    price       = forms.FloatField(required=False)
    category    = forms.CharField(required=False)
    brandtype   = forms.CharField(required=False)
    subcategoryid = forms.CharField(required=False)
    sortdata = forms.CharField(required=False)
    country=forms.CharField(required=False)
    ispremium=forms.CharField(required=False)
    # lang = forms.CharField(required=False)
    # groupby = forms.CharField(required=False)
    
    def no_query_found(self):
      print 'no_query_found'  
      data = self.searchqueryset.all()  
        
      if hasattr(self, 'cleaned_data'):
          save_object = None

          if self.cleaned_data['sortdata']:
              if (self.cleaned_data['sortdata'] == "createddate"):
                data = data.filter(active=1).filter(status='active').filter(available__gt=0).order_by('-created')
              
              if (self.cleaned_data['sortdata'] == "modifieddate"):
               data = data.filter(active=1).filter(status='active').filter(available__gt=0).order_by('-modified')
              
              if (self.cleaned_data['sortdata'] == "pricelow"):
                data = data.filter(active=1).filter(status='active').filter(available__gt=0).order_by('price')
              
              if (self.cleaned_data['sortdata'] == "pricehigh"):  
                data = data.filter(active=1).filter(status='active').filter(available__gt=0).order_by('-price')
       
      return data

    def get_default_filters(self):
      print 'get_default_filters'
      return None

    def get_default_search_field(self):
      print 'get_default_search_field'
      return 'searchtext'

    def get_model_class(self):
      print 'get_model_class'
      return Product

    def search(self):
      print 'searchv2'
      if not hasattr(self, 'cleaned_data'):
        return productsearch(model_cls=self.get_model_class(), 
          default_filters=self.get_default_filters())
        
      _params = [
        'locality',
        # 'keywords',
        # 'lang',
        'category',
        'price',
        'brandtype',
        'subcategoryid',
        'price_start',
        'price_end',
        'country',
        'ispremium',
      ]
      params = OrderedDict()
      print 'params', params
      for p in _params:
        if p in self.cleaned_data and self.cleaned_data[p]:
          params[p] =  self.cleaned_data[p]
        else:
          params[p] =  None

      # if params['lang']:
      #   if params['lang'] == 'en':
      #     params['lang'] = 'en,sv'

      #   params['lang'] = params['lang'].split(',')

      # if params['keywords']:
      #   params['keywords'] = params['keywords'].split(',')

      if params['country']:
        params['country'] = params['country']
        print "params['country']", params['country']
      
      if params['ispremium']:
        params['ispremium'] = params['ispremium']
        print "params['ispremium']", params['ispremium']

      q = self.cleaned_data['q'] if 'q' in self.cleaned_data else None
      groupby = None
      orderby = None

      orderby_mappings = {
        'createddate': 'created_date',
        'modifieddate': '-modified',
        'pricelow': 'base_price',
        'pricehigh': '-base_price',
        'ispremium': '-ispremium'
      }
      
      # if self.cleaned_data['groupby']:
      #   groupby = self.cleaned_data['groupby']

      if self.cleaned_data['sortdata']:
        orderby = self.cleaned_data['sortdata']
        if orderby in orderby_mappings:
          orderby = orderby_mappings[groupby]

      if not orderby:
        print "not orderby"
        orderby = orderby_mappings['ispremium']        

      return productsearch(q, params, orderby, groupby, model_cls=self.get_model_class(), 
        default_filters=self.get_default_filters(), 
        default_search_field=self.get_default_search_field())