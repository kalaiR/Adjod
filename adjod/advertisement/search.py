"""
Module to handle all search related tasks 
"""
import re
from collections import OrderedDict
from advertisement.models import Product
from haystack.query import SearchQuerySet
# from haystack.utils.geo import Point, D
from haystack.inputs import Clean, Raw
from haystack.query import SQ

default_param_mappings = OrderedDict(
  locations = 'locality__in',
  category = 'category',
  subcategoryid = 'subcategoryid',
)

default_geo_params = {
  'method': 'bydistance',
  'radius': 20
}

# default_orderby_mappings = {
#   'createddate': '-created',
#   'modifieddate': '-modified',
#   'pricelow': 'price',
#   'pricehigh': '-price'
# }

# default_lead_filters = {
#   'active': 1,
#   'status': 'active',
#   'available__gt': 0
# }

replace_regex = r'[/:]'
ignore_regex = r'[^\w^,]'
tokenizer_regex = re.compile(r'[,]', flags=re.UNICODE)


def tokenize(query, double_check=True):
  tokens = tokenizer_regex.split(query)
  return [q.strip() for q in tokens if q]

  # tokens = re.sub(tokenizer_regex, ' ', query, 
  #     flags=re.UNICODE).split(' ')
  # if double_check:
  #   tokens = [q for q in tokens \
  #     if q and (not re.match(tokenizer_regex, q, flags=re.UNICODE))]

  # return tokens


def prepare_search_query(query, search_field='searchtext'):

  query = query or ''
  qs = None

  query = re.sub(replace_regex, ' ', query, flags=re.UNICODE)
  tokens = tokenize(query)

  if tokens:
    cleand = Clean(query)
    qs = SQ(**{search_field:cleand})
    qs = qs | SQ(**{search_field + '__startswith': cleand})
    if len(tokens) > 1:
      for q in tokens:
        qs = qs | SQ(**{search_field:Clean(q)})
        qs = qs | SQ(**{search_field + '__startswith': Clean(q)})

  return qs

def search(
  q=None, params=None, orderby=None, groupby=None, 
  geo_location=None, geo_params=None, geo_orderby='distance', 
  model_cls=None, default_filters=None, param_mappings=None,
  default_search_field='searchtext'):
  
  print "search function"

  """Perform search leads using haystack"""

  if not model_cls:
    model_cls = Product

  if params is None:
    params = OrderedDict([('locality', None), ('category', None)]) 

  if orderby is None:
    orderby = '-created'  
  
  if geo_params is None:
    geo_params = default_geo_params

  # if default_filters is None:
  #   default_filters = default_lead_filters

  mappings = param_mappings or default_param_mappings
  
  print "advalue-41"

  sqs = SearchQuerySet().all()

  print "advalue-42"

  if q:
    print "advalue-43"
    qs = prepare_search_query(q, default_search_field)
    if qs:
      print "advalue-44"
      sqs = SearchQuerySet().filter(qs)

  sqs = sqs.models(model_cls)
  print "advalue-45", sqs
  # sqs = sqs.filter(**default_filters)
  

  if params:
    sq_params = OrderedDict()
    for given_param, search_param in mappings.iteritems():
      print 'given_param', given_param
      if has(params, given_param):
        print "params-451", sqs
        sq_params[search_param] =  params[given_param]
    
    print "advalue-46", params  
    if sq_params:
      sqs = sqs.filter(**sq_params)

  # if orderby:
  #   print "advalue-47", params  
  #   sqs = sqs.order_by(orderby)
  #   print "sqs", sqs  

  # if groupby:
  #   print "advalue-48", params  
  #   sqs = sqs.facet(groupby)

  # if geo_location:
  #   print "advalue-47-geo"
  #   if isinstance(geo_location, (str, unicode)):
  #     location = geo_location.split(',')
  #     location = Point(float(location[0]), float(location[1]))
  #   elif isinstance(geo_location, (list, tuple)):
  #     location = Point(float(geo_location[0]), float(geo_location[1]))      
  #   else:
  #     location = geo_location

  #   if geo_params['method'] == 'bydistance':
  #     radius = D(km=geo_params['radius'])
      
  #     sqs = sqs.dwithin('geolocation', location, radius)\
  #       .distance('geolocation', location)

  #   if geo_orderby:
  #     sqs = sqs.order_by('distance')

  #print "Created query", unicode(sqs.query), geo_location, geo_params
  print "advalue-4-final", sqs
  return sqs

def suggestion_with_count(field, q=None, limit=10, 
  model_cls=Product, default_filters=None, other_filters=None):

  # if default_filters is None:
  #   default_filters = default_lead_filters

  sqs = SearchQuerySet().all()
  if q:
    sqs = SearchQuerySet().filter(**{field+'__startswith':q})


  if other_filters:
    for k, v in other_filters.iteritems():
      if v:
        if isinstance(v, (list, tuple)):
          k = k + '__in'
        sqs = sqs.filter(**{k:v})

  sqs.models(model_cls)
  sqs = sqs.filter(**default_filters)

  fields = sqs.facet(field, size=limit).facet_counts()
  result = fields['fields'][field]
  result_uid = []
  for f, c in result:
    result_uid.append({'id':hash(f), 'name':f, 'count':c})

  return result_uid


def has(dictobj, key):
  return (key in dictobj) and dictobj[key]
