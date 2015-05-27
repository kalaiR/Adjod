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
from django.utils.encoding import smart_str
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

  # def create_tasks(self):
  #   print 'create_task'
  #   pass    

  # def runtasks(self, tasks):
  #   print 'runtask'
  #   freealert=FreeAlert.objects.all()
  #   usertracking=UserTracking()

  #   now=helper.get_now()
  #   for freealerts in freealert:
  #       alert_filter = Product.objects.filter(category=freealerts.alert_category, subcategory=freealerts.alert_subcategory,ad_brand=freealerts.alert_brand,city=freealerts.alert_city)
  #       for alert_filters in alert_filter:   
  #         usertrack=UserTracking.objects.get(track_user=alert_filters.userprofile.id)    
  #         if usertrack:
  #           usertrack.email_sent_count +=1
  #           usertrack.last_email_sent=now
  #           usertrack.save()
  #         else:
  #           usertracking.track_user=alert_filters.userprofile
  #           usertracking.email_sent_count +=1
  #           usertracking.last_email_sent=now
  #           usertracking.save()
  #         title = alert_filters.title
  #         content = "http://localhost:8000/postad/"
  #         # content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
  #         send_mail(title, content, 'testmail123sample@gmail.com', [freealerts.alert_email], fail_silently=False)
  #         print "mail sent successfully"

   def create_tasks(self):    
    print "create_tasks"
    workertask=WorkerTask.objects.get(worker=self.worker)
    workertask.status='init'
    workertask.save()   
    print "self.worker", self.worker.id
    tasks = WorkerTask.objects.filter(worker=self.worker, status='init')
    print "tasks", tasks
    for task in tasks:
      print "task.worker", task.worker
    # config = NoticeEmailConfig.objects.get(pk='default')
    if tasks.count():
      print "Got tasks", tasks.count()
    for task in tasks:
      try:
        now  = helper.get_now()
        if self.worker.wait_for_approval:
          now = now + timedelta(seconds = self.worker.wait_for_approval)
        task.scheduled = now
        task.status = 'scheduled'
        task.save()

        # logging.debug("scheduled Lead for notice email : " + ntask.product.title)
      except Exception, e:
        logging.critical(e)
        traceback.print_exc()
        task.status = 'failed'
        task.notes = "Error while creating task " + traceback.format_exc()
        task.save() 
   
   def runtasks(self, tasks):
    print "runtasks"
    freealert=FreeAlert.objects.all()   
    for task in tasks:
      now = helper.get_now()
      task.status = 'started'
      task.started = now
      task.save()
      try:
        now  = helper.get_now()
        yesterday = now - timedelta(seconds=5)
        # yesterday = now - timedelta(hours=24)
        print "task", task

        for freealerts in freealert:   
          if freealerts.last_email_sent!= datetime.datetime.now().time():  
          # if freealerts.last_email_sent!= datetime.date.today():    
            alert_filter = Product.objects.filter(category=freealerts.alert_category, subcategory=freealerts.alert_subcategory,ad_brand=freealerts.alert_brand,city=freealerts.alert_city)             
            product=[]
            for alert_filters in alert_filter:
              if UserTracking.objects.filter(track_alert=freealerts.id):
                print "enter if"
                usertrack= UserTracking.objects.get(track_alert=freealerts.id)    
                usertrack.email_sent_count +=1              
                usertrack.last_email_sent=now
                usertrack.save()
              else:
                print "enter else"
                print "freealerts.id", freealerts.id
                usertracking=UserTracking()
                usertracking.track_alert=FreeAlert.objects.get(id=freealerts.id)
                usertracking.email_sent_count +=1            
                usertracking.last_email_sent=now
                usertracking.save()
              title = alert_filters.title
              content = "http://localhost:8000/ads/" + str(alert_filters.id)
              # content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
              send_mail(title, content, 'testmail123sample@gmail.com', [freealerts.alert_email], fail_silently=False)
              print "mail sent successfully"

              task.status = 'completed'
              task.completed = helper.get_now()
              task.save()
              
              product.append(smart_str(alert_filters.id))
              print "product", product         
            
            freealerts.mail_is_sent=True
            freealerts.last_email_sent=now
            freealerts.save()
            
            if WorkerNoticeEmailTask.objects.get(created_alert=freealerts.id):    
              ntask=WorkerNoticeEmailTask.objects.get(created_alert=freealerts.id)      
            else:
              ntask=WorkerNoticeEmailTask()
            ntask.task=task
            ntask.created_alert=FreeAlert.objects.get(id=freealerts.id)          
            ntask.tracking_code=helper.randomkey(26)
            ntask.iteration_count+=1
            ntask.mailissent = 1
            ntask.last_email_sent=now
            ntask.save()
            ntask.product = product

          else:
            print "cron again occur as today's date"

      except Exception, e:
        logging.critical(e)
        traceback.print_exc()
        task.status = 'failed'
        task.notes = "Error while running task " + traceback.format_exc()
        task.save()