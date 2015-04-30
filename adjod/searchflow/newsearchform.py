import re
from django import forms
from collections import OrderedDict
from advertisement.models import *
from haystack.forms import SearchForm, FacetedSearchForm
from datetime import datetime
from django.http import HttpResponse, Http404
from searchflow.newsearchresults import searchresults as newproductsearch
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

class NewProductSearchFilter(FacetedSearchForm):
    print 'LeadSearchFilter'
    #Code included by Ramu
    model = None

    # def __init__ (self,request=None, using=None):
    #     from models import Lead
    #     self.model= Lead#kwargs.pop('models')        
    #     super(LeadSearchFilter,self).__init__(request, using=using, **kwargs)

    
    # budget_start = forms.FloatField(required=False)
    # budget_end = forms.FloatField(required=False)

    # deal_start = forms.DateField(required=False)
    # deal_end = forms.DateField(required=False)

    price_start = forms.FloatField(required=False)
    price_end = forms.FloatField(required=False)

    # created_start = forms.DateField(required=False)
    # created_end = forms.DateField(required=False)

    locality    = forms.CharField(required=False)
    price       = forms.FloatField(required=False)
    category    = forms.CharField(required=False)
    brandtype   = forms.CharField(required=False)
    subcategoryid = forms.CharField(required=False)

    # ranking_start = forms.FloatField(required=False)
    # ranking_end = forms.FloatField(required=False)

    # rating_start = forms.FloatField(required=False)
    # rating_end = forms.FloatField(required=False)

    # save_search = forms.BooleanField(required=False)
    # load_search = forms.IntegerField(required=False)
    
    sortdata = forms.CharField(required=False)
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

    # def get_default_queryset(self):
    #   print 'get_default_queryset' 
    #   sqs = SearchQuerySet().all()
    #   sqs = sqs.models(Lead)
    #   return sqs.filter(active=1).filter(status='active').filter(available__gt=0).order_by('-created')

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
        return newproductsearch(model_cls=self.get_model_class(), 
          default_filters=self.get_default_filters())
        
      _params = [
        'locality',
        # 'keywords',
        # 'lang',
        'category',
        'price',
        'brandtype',
        'subcategoryid',
        # 'budget_start',
        # 'budget_end',
        # 'deal_start',
        # 'deal_end',
        'price_start',
        'price_end',
        # 'created_start',
        # 'created_end',
        # 'ranking_start',
        # 'ranking_end',
        # 'rating_start',
        # 'rating_end',
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

      if params['locality']:
        params['locality'] = params['locality'].split(',')

      q = self.cleaned_data['q'] if 'q' in self.cleaned_data else None
      groupby = None
      orderby = None

      orderby_mappings = {
        'createddate': '-created',
        'modifieddate': '-modified',
        'pricelow': 'base_price',
        'pricehigh': '-base_price'
      }

      # if self.cleaned_data['groupby']:
      #   groupby = self.cleaned_data['groupby']

      if self.cleaned_data['sortdata']:
        orderby = self.cleaned_data['sortdata']
      #   if orderby in orderby_mappings:
      #     orderby = orderby_mappings[groupby]

      if not orderby:
        orderby = orderby_mappings['createddate']        

      return newproductsearch(q, params, orderby, groupby, model_cls=self.get_model_class(), 
        default_filters=self.get_default_filters(), 
        default_search_field=self.get_default_search_field())

    # def search(self):
    #     print 'basicsearch'
    #     return self.searchv2()

    #     sqs = self.get_default_queryset()
    #     search_field = self.get_default_search_field()
    
    #     if hasattr(self, 'cleaned_data'):
    #       original_query = self.cleaned_data['q']

    #       # Split by special character and space
    #       query = re.sub(r'[^\w]', ' ', original_query, 
    #         flags=re.UNICODE).split(' ')

    #       # Remove empty and special characters
    #       query = [q for q in query \
    #         if q and (not re.match(r'[^\w]', q, flags=re.UNICODE))]

    #       if query:
    #         # For some reason, if the query has '/' character, haystack gives
    #         # empty result and throws exception in elastic. "Clean" does not
    #         # clean this character. So remove this character manually with
    #         # space  
    #         original_query = original_query.replace('/', ' ')

    #         cleand = Clean(original_query)
    #         qs = SQ(**{search_field:cleand})
    #         qs = qs | SQ(**{search_field + '__startswith': cleand})

    #         cleand_q = ' '.join(query)
    #         if original_query != cleand_q:
    #           qs = qs | SQ(**{search_field:cleand_q})

    #         # if len(query) > 1:
    #         #   for q in query:
    #         #     qs = qs | SQ(**{search_field + '__startswith':Clean(q)})

    #         sqs = sqs.filter(qs)

    #     if hasattr(self, 'cleaned_data'):

    #       save_object = None
          
    #       if self.cleaned_data['save_search']:
    #         save_object = LeadFilter()
  
    #       if self.cleaned_data['lang']:
    #           selLang = self.cleaned_data['lang']
    #           if selLang =='en':
    #               sqs = sqs.filter(language__in=['en','sv'])
    #           else:
    #               sqs = sqs.filter(language=self.cleaned_data['lang'])
                  
                
    #       if self.cleaned_data['budget_start']:
    #           sqs = sqs.filter(budget__gte=self.cleaned_data['budget_start'])
    #           if save_object:
    #             save_object.budget_from = self.cleaned_data['budget_start']
  
    #       if self.cleaned_data['budget_end']:
    #           sqs = sqs.filter(budget__lte=self.cleaned_data['budget_end'])
    #           if save_object:
    #             save_object.budget_to = self.cleaned_data['budget_end']
  
    #       if self.cleaned_data['deal_start']:
    #           sqs = sqs.filter(deal_starts__gte=self.cleaned_data['deal_start'])
    #           if save_object:
    #             save_object.deal_time_from = self.cleaned_data['deal_start']
  
    #       if self.cleaned_data['deal_end']:
    #           sqs = sqs.filter(deal_ends__lte=self.cleaned_data['deal_end'])
    #           if save_object:
    #             save_object.deal_time_to = self.cleaned_data['deal_end']  
  
    #       if self.cleaned_data['price_start']:
    #           sqs = sqs.filter(price__gte=self.cleaned_data['price_start'])
    #           if save_object:
    #             save_object.price_from = self.cleaned_data['price_start']  
                  
    #       if self.cleaned_data['price_end']:
    #           sqs = sqs.filter(price__lte=self.cleaned_data['price_end'])
    #           if save_object:
    #             save_object.price_to = self.cleaned_data['price_end']  
  
    #       if self.cleaned_data['locations']:
    #           sqs = sqs.filter(locations__in=self.cleaned_data['locations'].split(','))
    #           if save_object:
    #             save_object.location = self.cleaned_data['locations']  
                
                    
    #       if self.cleaned_data['keywords']:
    #           sqs = sqs.filter(keywords__in=self.cleaned_data['keywords'].split(','))
    #           if save_object:
    #             save_object.keywords = self.cleaned_data['keywords']  
                                          
                          
    #       if self.cleaned_data['created_start']:
    #           sqs = sqs.filter(created__gte=self.cleaned_data['created_start'])
  
    #       if self.cleaned_data['created_end']:
    #           sqs = sqs.filter(created__lte=self.cleaned_data['created_end'])


    #       if self.cleaned_data['ranking_start']:
    #           # sqs = sqs.filter(ranking__gte=self.cleaned_data['ranking_start'])
    #           if save_object:
    #             save_object.ranking_from = self.cleaned_data['ranking_start']
  
    #       if self.cleaned_data['ranking_end']:
    #           # sqs = sqs.filter(ranking__lte=self.cleaned_data['ranking_end'])
    #           if save_object:
    #             save_object.ranking_to = self.cleaned_data['ranking_end']

    #       if self.cleaned_data['rating_start']:
    #           sqs = sqs.filter(rating__gte=self.cleaned_data['rating_start'])
    #           if save_object:
    #             save_object.rating_from = self.cleaned_data['rating_start']

  
    #       if self.cleaned_data['rating_end']:
    #           sqs = sqs.filter(rating__lte=self.cleaned_data['rating_end'])
    #           if save_object:
    #             save_object.rating_to = self.cleaned_data['rating_end']
   
    #       if self.cleaned_data['sortdata']:
    #           if (self.cleaned_data['sortdata'] == "createddate"):
    #             sqs = sqs.filter(active=1).filter(status='active').filter(available__gt=0).order_by('-created')
              
    #           if (self.cleaned_data['sortdata'] == "modifieddate"):
    #            sqs = sqs.filter(active=1).filter(status='active').filter(available__gt=0).order_by('-modified')
              
    #           if (self.cleaned_data['sortdata'] == "pricelow"):
    #             sqs = sqs.filter(active=1).filter(status='active').filter(available__gt=0).order_by('price')
              
    #           if (self.cleaned_data['sortdata'] == "pricehigh"):  
    #             sqs = sqs.filter(active=1).filter(status='active').filter(available__gt=0).order_by('-price')
               
    #           if save_object:
    #             save_object.sortdata = self.cleaned_data['sortdata']

    #       if self.cleaned_data['groupby']:
    #         groupby = self.cleaned_data['groupby']
    #         sqs = sqs.facet(groupby)
    #       print 'search', sqs 
    #     return sqs#sqs.models(self.model)
