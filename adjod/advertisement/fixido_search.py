# coding: utf-8 
# -*- coding: utf-8 -*-

from django.shortcuts import redirect
#from haystack.views import SearchView
# from fixido.util import get_global_language
from models import Product
from adjod.search_sites import SearchView

class AdjodSearchView(SearchView):
    ''' Customized SearchView to fetch leads 
        based on fixido language
    '''
    def first(self):
        return "hello"
    # product=Product.objects.all()
    # def __call__(self, request):
    #     if 'q' in request.REQUEST \
    #         and unicode(request.REQUEST['q']).isdigit():
    #         print "AdjodSearchView"          
    #         productid = long(request.REQUEST['q'])
    #         print productid
    #         if Product.objects.filter(id__exact=productid).exists():
    #             return redirect('product_detail', productid)

    #     # if request.user.is_authenticated():
    #     #     self.lang = request.user.actor.language
    #     # else:
    #     #     self.lang = get_global_language(request)
        
    #     query_string = request.META.get('QUERY_STRING', '').split('&')
    #     qsl = [qs for qs in query_string if qs.startswith('q=')]
    #     query = qsl[0].replace('q=', '').decode('latin1') if qsl else u''
        
    #     if u'�' in request.REQUEST.get('q', u''):
    #         if request.method == "GET":
    #             request.GET._mutable = True
    #             request.GET['q'] = query
    #             request.GET._mutable = False

    #         elif request.method == "POST":
    #             request.POST._mutable = True
    #             request.POST['q'] = query
    #             request.POST._mutable = False

    #     return super(AdjodSearchView, self).__call__(request)

    # def build_form(self, form_kwargs=None):
    #     form = super(AdjodSearchView, self).build_form(form_kwargs=form_kwargs)
    #     form_data = form.data.copy()
    #     # form_data['lang'] = self.lang
    #     form.data = form_data
    #     return form 