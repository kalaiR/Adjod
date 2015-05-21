import logging
import time
import traceback
import operator
from datetime import datetime, timedelta
from models import *
from django.conf import settings
from django.contrib.sites.models import Site
from advertisement.models import *
from templated_email import send_templated_mail
from core import helper
# from actors import globals as glb #couldn't work w/o request

class WorkerBase(object):

  def __init__(self, worker):
    self.worker = worker

  def create_tasks(self):
    pass

  def prepare(self):
    pass

  def runtasks(self, tasks):
    pass

  def finish(self):
    pass

class EmailNotificationWorker(WorkerBase):

  def create_tasks(self):
    print 'create_task'
    pass    

  # def runtasks(self, tasks):
  #   print 'runtask'
  #   city = City()
  #   city.city = 'Bangalore'
  #   city.save()

  # def runtasks(self, tasks):
  #   print 'runtask'
  #   freealert=FreeAlert.objects.all()
  #   usertracking=UserTracking()
  #   now=helper.get_now()
  #   for freealerts in freealert:
  #       alert_filter = Product.objects.filter(category=freealerts.alert_category, subcategory=freealerts.alert_subcategory,ad_brand=freealerts.alert_brand,city=freealerts.alert_city)
  #       print alert_filter
  #       for alert_filters in alert_filter:
  #         usertracking.track_user=alert_filters.userprofile
  #         usertracking.email_sent_count +=1
  #         usertracking.last_email_sent=now
  #         usertracking.save()
  #         title = alert_filters.title
  #         content = "http://localhost:8000/postad/"
  #         # content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
  #         send_mail(title, content, 'testmail123sample@gmail.com', [freealerts.alert_email], fail_silently=False)
  #         print "mail sent successfully"

  def runtasks(self, tasks):
    print 'runtask'
    freealert=FreeAlert.objects.all()
    usertracking=UserTracking()

    now=helper.get_now()
    for freealerts in freealert:
        alert_filter = Product.objects.filter(category=freealerts.alert_category, subcategory=freealerts.alert_subcategory,ad_brand=freealerts.alert_brand,city=freealerts.alert_city)
        for alert_filters in alert_filter:   
          usertrack=UserTracking.objects.get(track_user=alert_filters.userprofile.id)    
          if usertrack:
            usertrack.email_sent_count +=1
            usertrack.last_email_sent=now
            usertrack.save()
          else:
            usertracking.track_user=alert_filters.userprofile
            usertracking.email_sent_count +=1
            usertracking.last_email_sent=now
            usertracking.save()
          title = alert_filters.title
          content = "http://localhost:8000/postad/"
          # content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
          send_mail(title, content, 'testmail123sample@gmail.com', [freealerts.alert_email], fail_silently=False)
          print "mail sent successfully"
