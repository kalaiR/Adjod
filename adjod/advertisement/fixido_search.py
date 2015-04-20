# coding: utf-8 
# -*- coding: utf-8 -*-

from django.shortcuts import redirect
# from haystack.views import SearchView
# from fixido.util import get_global_language
from models import Product, SubCategory
from adjod.search_sites import SearchView


class AdjodSearchView(SearchView):
    print "AdjodSearchView"
    ''' Customized SearchView to fetch leads 
        based on fixido language
    '''
    # def get_subcategory(self, request, subcategoryname, categoryname):
    #     print subcategoryname
    #     return subcategoryname
    
    def __call__(self, request):
        print "enter call function"
        print "q value", request.REQUEST['q']
        # print unicode(request.REQUEST).isdigit()
        # if 'subcategory_value' in request.REQUEST:
        #     print "subcategory_value", subcategory_value
        if 'q' in request.REQUEST and unicode(request.REQUEST['q']).isdigit():
            print "enter if"          
            productid = long(request.REQUEST['q'])
            print "productid", productid
            if Product.objects.filter(id__exact=productid).exists():
                return redirect('productDetail', productid)



        # if request.user.is_authenticated():
        #     self.lang = request.user.actor.language
        # else:
        #     self.lang = get_global_language(request)
        
        query_string = request.META.get('QUERY_STRING', '').split('&')
        qsl = [qs for qs in query_string if qs.startswith('q=')]
        query = qsl[0].replace('q=', '').decode('latin1') if qsl else u''
        
        if u'�' in request.REQUEST.get('q', u''):
            if request.method == "GET":
                request.GET._mutable = True
                request.GET['q'] = query
                request.GET._mutable = False

            elif request.method == "POST":
                request.POST._mutable = True
                request.POST['q'] = query
                request.POST._mutable = False

        return super(AdjodSearchView, self).__call__(request)


    def build_form(self, form_kwargs=None):
        print "build_form"
        form = super(AdjodSearchView, self).build_form(form_kwargs=form_kwargs)
        form_data = form.data.copy()
        # form_data['lang'] = self.lang
        form.data = form_data
        return form 



class AdjodSearchViewCategory(SearchView):
    print "AdjodSearchViewCategory"
    def __call__(self, request, subcategoryname, categoryname):

        # print "enter call function"
        # print "request.REQUEST['q']", request.REQUEST['q']        
        # productid = long(request.REQUEST['q'])
        # print "productid", productid
        if 'q' in request.REQUEST and unicode(request.REQUEST['q']).isdigit():
            print "enter if"          
            productid = long(request.REQUEST['q'])
            print "productid", productid
            sub=Product.objects.filter(subcategory=productid)
            for sub1 in sub:
                print sub1.title
            # if Product.objects.filter(subcategory=productid).exists():
            #     return redirect('productDetail', productid)
        return super(AdjodSearchViewCategory, self).__call__(request)