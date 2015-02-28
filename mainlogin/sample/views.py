# Create your views here.
from sample.models import *

from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.core.context_processors import csrf 
from django.views.decorators.csrf import csrf_protect
from django.shortcuts import render_to_response, render

from django.template import RequestContext
from django.contrib.auth import authenticate, login
from django.http import HttpResponseRedirect, HttpResponse
from django import forms
from django.contrib.auth.tokens import default_token_generator
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import ugettext, string_concat


def sample_home(request):
      
      return render_to_response('sample/samplefile.html', { }, context_instance=RequestContext(request)) 

def sample_save(request):
      calls=Calls()
      calls.brand=request.POST.get('brand','')
      calls.year=request.POST.get('year','')
      calls.save()
      
      first=First()
      first.name=request.POST.get('name','')
      first.callfields=calls
      first.save()
      
      
      return render_to_response('sample/samplefile.html', {'calls':calls }, context_instance=RequestContext(request)) 