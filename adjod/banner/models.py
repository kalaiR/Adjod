from django.db import models
from adjod.models import UserProfile
from core.extra import ContentTypeRestrictedFileField
from datetime import timedelta,datetime

POSITION = (
    ('Top', 'Top of the page'),
    ('Bottom', 'Bottom of the page'),
    ('Center', 'Center of the page'),
    ('Right', 'Right of the page'),
    ('Right_top', 'Right top of the page'),
    ('Right_bottom', 'Right bottom of the page'),
    ('Left', 'Left of the page'),
)

PAGEURL = (
    ('Home page', 'Home page'),
    ('Listing page', 'Listing page'),
    ('Details page', 'Details page'),
)

BANNERTYPE = (
    ('Own', 'Own Banner'),
    ('Google', 'Google Banner'),
)

class BannerPlan(models.Model):
    page = models.CharField(max_length=50, choices=PAGEURL,help_text='Choose which page you want show your banner')
    position = models.CharField(max_length=50, choices=POSITION,help_text='Choose position of your banner')
    price = models.FloatField(null=True, default=0.0,help_text='Amount of the banner based on page and position')
    plan_duration = models.BigIntegerField(
        null=True, help_text="No of days allowed")
    bannertype = models.CharField(max_length=50, choices=BANNERTYPE, help_text='Choose BannerType of your banner')
    class Meta:
        unique_together = ("page", "position", "bannertype")

    def __unicode__(self):
        return unicode(self.page+' '+self.position+' '+self.bannertype)


class PostBanner(models.Model):
    # user = models.ForeignKey(UserProfile, null=True, blank=True,help_text='Choose which user post banner in site')
    banner = ContentTypeRestrictedFileField(upload_to='banners',
        content_types=['image/jpeg','image/jpeg', 'image/png','image/gif'], max_upload_size=2097152,
        help_text="Please upload the banner Image with 2MB min and jpg, png \
        , gif format only allowed")
    link = models.CharField(max_length=200, null=True,
                            blank=True,
                            help_text="Please enter the website link")
    bannerplan = models.ForeignKey(BannerPlan,help_text='Choose bannerplan')
    startdate = models.DateTimeField(
        default=datetime.now(), help_text="Startdate for banner")
    enddate = models.DateTimeField(default=datetime.now(
    ) + timedelta(days=30), help_text="Enddate for banner")
    admin_status = models.BooleanField(default=False)

    def __unicode__(self):
        return unicode(self.banner)
