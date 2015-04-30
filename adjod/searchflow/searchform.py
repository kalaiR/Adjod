# import re
# from django import forms
# from collections import OrderedDict
# import advertisement
# from haystack.forms import SearchForm, FacetedSearchForm
# from datetime import datetime
# from django.http import HttpResponse, Http404
# from advertisement.search import search as productsearch

# from haystack.query import SearchQuerySet
# from haystack.inputs import Clean, Raw, AutoQuery, Exact
# from haystack.query import SQ
# from models import Product

# class Partial(Clean):
#     input_type_name = 'partial'
#     post_process = True

#     def __init__(self, query_string, **kwargs):
#         self.original = query_string
#         super(Partial, self).__init__(query_string, **kwargs)

#     def prepare(self, query_obj):
#         query_string = super(Partial, self).prepare(query_obj)
#         query_string = query_string.lower()
#         query_string = re.sub( '\s+', '* ', query_string).strip()

#         if query_string[-1] != '*':
#           query_string = query_string + u'*'

#         print "Searching", self.original, query_string
#         return 

# class NewProductSearchFilter(FacetedSearchForm):
#     print "advalue-3"
#     model = None

#     #  Advance Search Options #
#     subcategoryid = forms.CharField(required=False)
#     # brands      = forms.CharField(required=False)
#     # price_start = forms.FloatField(required=False)
#     # price_end   = forms.FloatField(required=False)
#     #keywords    = forms.CharField(required=False)
#     #User/New Include #    

#     #   Basic Search Options #
#     locality = forms.CharField(required=False)
#     category = forms.CharField(required=False)
   
#     def no_query_found(self):      

#       data = self.searchqueryset.all()        
#       if hasattr(self, 'cleaned_data'):
#           save_object = None

#           # if (self.cleaned_data['sortdata'] == "pricelow"):
#           #     data = data.filter(active=1).filter(status='active').filter(available__gt=0).order_by('price')
              
#           # if (self.cleaned_data['sortdata'] == "pricehigh"):  
#           #     data = data.filter(active=1).filter(status='active').filter(available__gt=0).order_by('-price')  
              
#       return data

#     def get_default_queryset(self):
#       sqs = SearchQuerySet().all()
#       sqs = sqs.models(Product)
#       print "get_default_queryset", sqs
#       return sqs.all().order_by('-created_date')

#     def get_category_queryset(self, request):
#       sqs = SearchQuerySet().all()
#       sqs = sqs.models(Product)
#       sqs1= sqs.filter(subcategoryid=request.GET['q'])
#       #print "get_category_queryset sqs1", sqs1
#       return sqs.filter(subcategoryid=request.GET['q']).order_by('-created_date')

#     def get_default_filters(self):
#       return None

#     def get_default_search_field(self):
#       return 'searchtext'

#     def get_model_class(self):
#       return Product


#     def searchv2(self):
     
#       if not hasattr(self, 'cleaned_data'):
#         return productsearch(model_cls=self.get_model_class(), 
#           default_filters=self.get_default_filters())
        
#       _params = [
#         'locality',
#         # 'keywords',
#           'category',
#         # 'price_start',
#         # 'price_end',
#           'subcategoryid',
#         # 'brands',
#       ]

#       params = OrderedDict()
#       for p in _params:
#         if p in self.cleaned_data and self.cleaned_data[p]:
#           params[p] =  self.cleaned_data[p]
#         else:
#           params[p] =  None

#       print "searchv21"
      
#       if params['locality']:
#         params['locality'] = params['locality'].split(',')

#       q = self.cleaned_data['q'] if 'q' in self.cleaned_data else None
#       groupby = None
#       orderby = None
      
#       print "searchv22"

#       orderby_mappings = {
#         'createddate': '-created',
#         'modifieddate': '-modified',
#         'pricelow': 'base_price',
#         'pricehigh': '-base_price'
#       }

#       # if self.cleaned_data['groupby']:
#       #   groupby = self.cleaned_data['groupby']
#       if not orderby:
#         orderby = orderby_mappings['createddate']        

#       print "searchv23", q  
      
#       return newproductsearch(q, params, orderby, groupby, model_cls=self.get_model_class(), 
#         default_filters=self.get_default_filters(), 
#         default_search_field=self.get_default_search_field())

#     def search(self, request):   
#         return self.searchv2()           
#         sqs = self.get_default_queryset()
#         search_field = self.get_default_search_field()

#         if 'q' in request.REQUEST and unicode(request.REQUEST['q']).isdigit():
#           sqs=self.get_category_queryset(request)
#           return sqs
        
#         if hasattr(self, 'cleaned_data'):
#           original_query = self.cleaned_data['q']

#           # Split by special character and space
#           query = re.sub(r'[^\w]', ' ', original_query, 
#             flags=re.UNICODE).split(' ')
          
#           # Remove empty and special characters
#           query = [q for q in query \
#             if q and (not re.match(r'[^\w]', q, flags=re.UNICODE))]
#           print "advance query", query
#           if query:
#             print 'eneter query'
#             # For some reason, if the query has '/' character, haystack gives
#             # empty result and throws exception in elastic. "Clean" does not
#             # clean this character. So remove this character manually with
#             # space  
#             original_query = original_query.replace('/', ' ')

#             cleand = Clean(original_query)
#             qs = SQ(**{search_field:cleand})
#             qs = qs | SQ(**{search_field + '__startswith': cleand})

#             cleand_q = ' '.join(query)
#             if original_query != cleand_q:
#               qs = qs | SQ(**{search_field:cleand_q})

#             # if len(query) > 1:
#             #   for q in query:
#             #     qs = qs | SQ(**{search_field + '__startswith':Clean(q)})
#             sqs = sqs.filter(qs)


#         if hasattr(self, 'cleaned_data'):

#           save_object = None
          
#           # if self.cleaned_data['groupby']:
#           #   groupby = self.cleaned_data['groupby']
#           #   sqs = sqs.facet(groupby)
          
#         return sqs#sqs.models(self.model)


