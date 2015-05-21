from django.db import models
from advertisement.models import *
from adjod.models import *

WorkerTaskStatus = (
  ('init', 'Initialized'),
  ('wait_for_approval', 'Wait for Approval'),
  ('scheduled', 'Scheduled'),
  ('started', 'Started'),
  ('failed', 'Failed'),
  ('completed', 'Completed'),
  ('canceled', 'Canceled')
)

class Worker(models.Model):

  id = models.CharField(max_length=128, unique=True, primary_key=True)
  name = models.CharField(max_length=128)
  cls_path = models.CharField(max_length=512)

  interval = models.BigIntegerField(default=60*5, help_text="interval in seconds")
  wait_for_approval = models.BigIntegerField(default=60*60*2, help_text="prepare the task and wait for approval")
  notify_for_approval = models.CharField(max_length=2048, blank=True, null=True, help_text="List email id to notify")
  notify_for_errors = models.CharField(max_length=2048, blank=True, null=True, help_text="List email id to notify")

  options = models.TextField(null=True, blank=True)
  active = models.BooleanField(default=True)

  @staticmethod
  def default_data():
    workers = Worker(id='freealert_notice_email')
    worker.name = 'Freealert Notice Email'
    worker.cls_path = 'worker.workers.EmailNotificationWorker'
    worker.save()

  def __unicode__(self):
    return self.id

class WorkerTask(models.Model):

  worker = models.ForeignKey(Worker)
  notes = models.TextField(null=True, blank=True)
  worker_options = models.TextField(null=True, blank=True)
  status = models.CharField(max_length=64, choices=WorkerTaskStatus, default='init')


  scheduled = models.DateTimeField(blank=True, null=True)
  started = models.DateTimeField(blank=True, null=True)
  completed = models.DateTimeField(blank=True, null=True)

  modified = models.DateTimeField(auto_now_add=True, auto_now=True)

# class ProductEmailTracking(models.Model):
#   product = models.ForeignKey(Product)
#   # campaign = models.CharField(max_length=256, blank=True, null=True)

#   read_count = models.PositiveIntegerField(default=0, help_text="Number of people opened the email")
#   view_count = models.PositiveIntegerField(default=0, help_text="Number of people opened the link")
#   # bounce_count = models.PositiveIntegerField(default=0, help_text="Number of people opened the link but didn't buy")
#   # success_count = models.PositiveIntegerField(default=0, help_text="Number of people bought the lead")

class UserTracking(models.Model):
  track_user = models.ForeignKey(UserProfile)
  email_sent_count = models.PositiveIntegerField(default=0, help_text="Total number of email sent to this user")
  email_read_count = models.PositiveIntegerField(default=0, help_text="Number of times user have read an email")
  email_view_count = models.PositiveIntegerField(default=0, help_text="Number of times user have clicked the link")

  # number_of_search = models.PositiveIntegerField(default=0)
  # number_of_brought = models.PositiveIntegerField(default=0)

  # latest_unread_count = models.PositiveIntegerField(default=0)
  # latest_visit = models.DateTimeField(null=True)
  # lastest_email_response = models.DateTimeField(null=True)

  recent_email_fail_count = models.PositiveIntegerField(default=0)
  last_email_sent = models.DateTimeField(null=True)
  # notice_email_q = models.ManyToManyField(WorkerNoticeEmailTask, blank=True, null=True )

  # rank = models.FloatField(default=0.0, help_text="System generated rank for the user based on his activity")

  