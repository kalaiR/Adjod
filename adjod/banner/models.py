from django.db import models
from adjod.models import UserProfile
from core.extra import ContentTypeRestrictedFileField
from datetime import timedelta,datetime

POSITION = (
    ('Top', 'Top of the page'),
    ('Bottom', 'Bottom of the page'),
    ('Center', 'Center of the page'),
    ('Right', 'Right of the page'),
)

PAGEURL = (
    ('All pages', 'All pages'),
    ('Home page', 'Home page'),
    ('Listing page', 'Listing page'),
    ('Details page', 'Details page'),
)

class BannerPlan(models.Model):
    """
    This Model is used for maintaining different banner plans.
    """
    page = models.CharField(max_length=50, choices=PAGEURL,
                            help_text="page = All is only \
                            applicable for top position of all pages")
    position = models.CharField(max_length=50, choices=POSITION)
    price = models.FloatField(null=True, default=0.0)
    plan_duration = models.BigIntegerField(
        null=True, blank=True, help_text="No of days allowed")

    class Meta:
        unique_together = [("page", "position")]

    def __unicode__(self):
        return unicode(self.id)


class PostBanner(models.Model):
    """
    This Model is used for maintaining list of banners 
    posted by users.
    """
    user = models.ForeignKey(UserProfile)
    banner = ContentTypeRestrictedFileField(upload_to='static/banners',
        content_types=['image/jpeg', 'image/png'], max_upload_size=2097152,
        help_text="Please upload the banner Image with 2MB min and jpg, png \
        format only allowed")
    link = models.CharField(max_length=200, null=True,
                            blank=True,
                            help_text="Please enter the website link")
    bannerplan = models.ForeignKey(BannerPlan)
    startdate = models.DateTimeField(
        default=datetime.now(), help_text="Startdate for banner")
    enddate = models.DateTimeField(default=datetime.now(
    ) + timedelta(days=30), help_text="Enddate for banner")
    admin_status = models.BooleanField(default=False)

    def __unicode__(self):
        return unicode(self.banner)


