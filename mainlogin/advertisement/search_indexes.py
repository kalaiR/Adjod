from haystack import indexes
import datetime


# from elasticstack.fields import CharField
from django.utils import timezone
# from haystack.backends.elasticsearch_backend import ElasticsearchSearchEngine, ElasticsearchSearchBackend

from advertisement.models import *
from django.conf import settings


# class NoteIndex(indexes.SearchIndex, indexes.Indexable):
#     text = indexes.CharField(document=True, use_template=True)
#     title = indexes.CharField(model_attr='title')
#     body = indexes.CharField(model_attr='body')

#     def get_model(self):
#         return Note

#     def index_queryset(self, using=None):
#         """Used when the entire index for model is updated."""
#         return self.get_model().objects.filter(timestamp__lte=timezone.now())


class ProductsearchIndex(indexes.SearchIndex, indexes.Indexable):

    
    # text = indexes.NgramField(document=True, use_template=True, analyzer=settings.ELASTICSEARCH_DEFAULT_ANALYZER)
    text = indexes.NgramField(document=True, use_template=True)
    title = indexes.CharField(model_attr='title')
    price = indexes.CharField(model_attr='price')
    # subcategory=indexes.NgramField(model_attr='subcategory')
    # autocomplete_field = indexes.NgramField(model_attr='autocomplete_field')
    # created_at = indexes.DateTimeField(model_attr='created_at')
    # content_auto = indexes.EdgeNgramField(model_attr='content')

    

    def get_model(self):
        return Product

    def index_queryset(self, using=None):
        

        """Used when the entire index for model is updated."""
        return self.get_model().objects.all()
    # return self.get_model().objects.filter(created_at__lte=datetime.datetime.now())

# class ProductIndex(indexes.SearchIndex):
#     title = indexes.CharField(document=True, use_template=True)
#     price = indexes.CharField(model_attr='price')
    

#     def get_model(self):
#         return Product

#     def index_queryset(self, using=None):
#         """Used when the entire index for model is updated."""
#         return self.get_model().objects.all()

# class ProductIndex(indexes.SearchIndex, indexes.Indexable):
#     text = indexes.CharField(document=True, use_template=True)
#     price = indexes.CharField(model_attr='price')
#     created_at = indexes.DateTimeField(model_attr='created_at')

#     def get_model(self):
#         return Product

#     def index_queryset(self, using=None):
#         """Used when the entire index for model is updated."""
#         return self.get_model().objects.filter(created_at__lte=datetime.datetime.now())
    

