
# Django settings for adjod project.
import os
from django.conf.global_settings import TEMPLATE_CONTEXT_PROCESSORS
from django.conf.urls import patterns, include, url
import smtplib
from django.utils.translation import ugettext_lazy, ugettext as _
DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    # ('Your Name', 'your_email@example.com'),
)

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'adjod',                      # Or path to database file if using sqlite3.
        'USER': 'root',                      # Not used with sqlite3.
        'PASSWORD': 'root',                  # Not used with sqlite3.
        'HOST': 'localhost',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '3306',                      # Set to empty string for default. Not used with sqlite3.
    }
}

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# In a Windows environment this must be set to your system time zone.
TIME_ZONE = 'America/Chicago'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True


# gettext = lambda s: s
# LANGUAGES = (
#     # ('he-il', gettext('Hebrew')),
#     ('en-us', gettext('English')),
# )


LANGUAGES = (
  ('en', _('English')),
  ('en-UK', _('English - United Kingdom')),
  ('sv', _('Swedish')),
  ('da', _('Danish')),
  ('fi', _('Finish')),
  ('fr', _('French')),
  ('de', _('German')),
  ('it', _('Italian')),
  ('nn', _('Norwegian')),
  ('pl', _('Polish')),
  ('pt', _('Portuguese')),
  ('ru', _('Russian')),
  ('se', _('Spanish')), 
)

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale.
USE_L10N = True

# If you set this to False, Django will not use timezone-aware datetimes.
USE_TZ = True

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = ''

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
MEDIA_URL = ''

# Absolute path to the directory static files should be collected to.
# Don't put anything in this directory yourself; store your static files
# in apps' "static/" subdirectories and in STATICFILES_DIRS.
# Example: "/home/media/media.lawrence.com/static/"
# STATIC_ROOT = 'static/img/photos/'
STATIC_ROOT = '/static/'
IMAGES_ROOT = os.path.join(os.path.dirname(__file__), '..static/img/photos/')

# URL prefix for static files.
# Example: "http://media.lawrence.com/static/"
STATIC_URL = '/static/'

# SITE_NAME = 'alpha.login.com'
# SITE_SASH = STATIC_URL + 'img/car.png'

# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    os.path.join(os.path.dirname(__file__), '../static'),
)



# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'i95gwsqfo9nmejbll=t@!3z1(2@l4#9hee7!3x6dw8ad^&amp;u*cb'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
   
#   'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'pagination.middleware.PaginationMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    
    # 'templatetags.app_filters.get_photos',
    # Uncomment the next line for simple clickjacking protection:
    # 'django.middleware.clickjacking.XFrameOptionsMiddleware',

    


)

TEMPLATE_CONTEXT_PROCESSORS += (
     'social_auth.context_processors.social_auth_by_name_backends',
     'social_auth.context_processors.social_auth_backends',
     'social_auth.context_processors.social_auth_by_type_backends',
     'social_auth.context_processors.social_auth_login_redirect',
     'django.core.context_processors.request',
     'django.core.context_processors.i18n',
     'django.core.context_processors.csrf',  
     'django.core.context_processors.media',
     'django.core.context_processors.debug',
     
)



LOCALE_PATHS = (
    os.path.join(os.path.dirname(__file__), '../locale'),
)

USE_I18N = True

ROOT_URLCONF = 'adjod.urls'

# Python dotted path to the WSGI application used by Django's runserver.
WSGI_APPLICATION = 'adjod.wsgi.application'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    os.path.join(os.path.dirname(__file__), '../templates'),
)


INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # Uncomment the next line to enable the admin:
    'django.contrib.admin',
    # Uncomment the next line to enable admin documentation:
    'django.contrib.admindocs',
    'adjod',
    'advertisement',
    'searchflow',
    # 'south',
    'haystack',
    # 'thumbnailfield',
    # 'thumbnail_works'
    # 'easy_thumbnails',
    # 'communication',
    # 'smsverify',
    # 'hstest.apps.notes',
    # 'rollyourown.seo',
   'paypal.standard.ipn',
   'services',
    # 'rest_framework',
   'fxapi',
   'django_nose',
   'worker',
   'banner'
)

TEST_RUNNER = "django_nose.NoseTestSuiteRunner"

# PAYPAL_RECEIVER_EMAIL = "kalaimca.gs-facilitator@gmail.com"

# PAYPAL_TEST = True

# PAYPAL_WPP_USER="kalaimca.gs-facilitator_api1.gmail.com"
# PAYPAL_WPP_PASSWORD="E5K4SG8QVGCDNHCB"
# PAYPAL_WPP_SIGNATURE="An5ns1Kso7MWUdW4ErQKJJJ4qi4-AGHrwon-aVUnmGFr91HclSLKbD9i"

# # PAYPAL_NOTIFY_URL = "URL_ROOT/charge/difficult_to_guess"
# # PAYPAL_RETURN_URL = "URL_ROOT/charge/return/"
# # PAYPAL_CANCEL_URL = "URL_ROOT/charge/cancel/"

# # PAYPAL_URL = 'https://www.paypal.com/cgi-bin/webscr'
# # PAYPAL_BUSS_EMAIL = 'kalaimca.gs@gmail.com'

# SANDBOX_URL = 'https://www.sandbox.paypal.com/cgi-bin/webscr'
# SANDBOX_BUSS_EMAIL = 'kalaimca.gs@gmail.com'

PAYPAL_TEST = True

# PAYPAL_WPP_USER="deepakkuppusamy.gs_api1.gmail.com"
# PAYPAL_WPP_PASSWORD="B4EZQAD7HB9YSPZK"
# PAYPAL_WPP_SIGNATURE="AHh0-xqrPaS38e0xjX6pRc5LW9xJAYFajBsE0WXyhc-6KBtFDJ1VHlP7"

# PAYPAL_URL = 'https://www.sandbox.paypal.com/au/cgi-bin/webscr'
# PAYPAL_BUSS_EMAIL = 'deepak-facilitator@globalensolutions.com'

# PAYPAL_NOTIFY_URL = "URL_ROOT/charge/difficult_to_guess"
# PAYPAL_RETURN_URL = "URL_ROOT/charge/return/"
# PAYPAL_CANCEL_URL = "URL_ROOT/charge/cancel/"

# PAYPAL_URL = 'https://www.paypal.com/cgi-bin/webscr'
# PAYPAL_BUSS_EMAIL = 'kalaimca.gs@gmail.com'

# 

PAYPAL_RECEIVER_EMAIL = "deepakkuppusamy.gs@gmail.com"

SANDBOX_URL = 'https://www.sandbox.paypal.com/cgi-bin/webscr'
SANDBOX_BUSS_EMAIL = 'deepakkuppusamy.gs@gmail.com'

THUMBNAIL_ALIASES = {
    '': {
        'avatar': {'size': (50, 50), 'crop': True},
    },
}


HAYSTACK_SIGNAL_PROCESSOR = 'haystack.signals.RealtimeSignalProcessor'
HAYSTACK_CONNECTIONS = dict(
  default = dict(
    ENGINE = 'searchflow.newsearchsites.FixidoSearchEngine',
    URL = 'http://46.4.81.207:9200/',
    # URL = 'http://127.0.0.1:9200/',
    INDEX_NAME = 'adjod'
  )
)

# HAYSTACK_CUSTOM_HIGHLIGHTER ='fixido.haystack.utils.Highlighter'
HAYSTACK_CUSTOM_HIGHLIGHTER ='adjod.search_sites.SearchHighlighter'

# SEARCH_PAGE_NUMBER_OF_LEADS = 70
LOGIN_URL = '/login/'
LOGIN_REDIRECT_URL = '/'
LOGIN_ERROR_URL = '/login_error/'

AUTHENTICATION_BACKENDS = (
  'social_auth.backends.contrib.linkedin.LinkedinBackend',
  'django.contrib.auth.backends.ModelBackend',
)

# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}

TWILIO_ACCOUNT_SID = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
TWILIO_AUTH_TOKEN = 'YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY'

AUTH_PROFILE_MODULE = 'adjod.UserProfile'

# LOGIN_REDIRECT_URL = '/registration/welcome/'
# LOGIN_URL = '/registration/login/'
# LOGOUT_URL = '/registration/logout/'

ACCOUNT_ACTIVATION_DAYS = 1

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'testmail123sample@gmail.com'
EMAIL_HOST_PASSWORD = 'testmail123'
EMAIL_PORT = 587

# ELASTICSEARCH_INDEX_SETTINGS = {
#     'settings': {
#         "analysis": {
#             "analyzer": {
#                 "synonym_analyzer" : {
#                     "type": "custom",
#                     "tokenizer" : "standard",
#                     "filter" : ["synonym"]
#                 },
#                 "ngram_analyzer": {
#                     "type": "custom",
#                     "tokenizer": "lowercase",
#                     "filter": ["haystack_ngram", "synonym"]
#                 },
#                 "edgengram_analyzer": {
#                     "type": "custom",
#                     "tokenizer": "lowercase",
#                     "filter": ["haystack_edgengram"]
#                 }
#             },
#             "tokenizer": {
#                 "haystack_ngram_tokenizer": {
#                     "type": "nGram",
#                     "min_gram": 2,
#                     "max_gram": 15,
#                 },
#                 "haystack_edgengram_tokenizer": {
#                     "type": "edgeNGram",
#                     "min_gram": 2,
#                     "max_gram": 15,
#                     "side": "front"
#                 }
#             },
#             "filter": {
#                 "haystack_ngram": {
#                     "type": "nGram",
#                     "min_gram": 2,
#                     "max_gram": 15
#                 },
#                 "haystack_edgengram": {
#                     "type": "edgeNGram",
#                     "min_gram": 2,
#                     "max_gram": 15
#                 },
#                 "synonym" : {
#                     "type" : "synonym",
#                     "ignore_case": "true",
#                     "synonyms_path" : "synonyms.txt"
#                 }
#             }
#         }
#     }
# }

# ELASTICSEARCH_DEFAULT_ANALYZER = 'synonym_analyzer'

# ELASTICSEARCH_INDEX_SETTINGS={
# "index":{
# "analysis":{
#     "analyzer":{
#         "default_index":{
#             "tokenizer": "standard"
#             "filter": ["standard", "stop", "edgeNGram"]
#         }
#         "default_search":{
#             "tokenizer": "standard"
#             "filter": ["standard", "stop"]
#         }   
#     },   
#     "filter":{
#         "edgeNGram":
#             "type": "nGram"
#             "min_gram": 1
#             "max_gram": 10
#     }
# }
# }
# }


# ELASTICSEARCH_INDEX_SETTINGS = {
#         "settings" : {
#             "analysis" : {
#                 "analyzer" : {
#                     "my_ngram_analyzer" : {
#                         "tokenizer" : "my_ngram_tokenizer"
#                     }
#                 },
#                 "tokenizer" : {
#                     "my_ngram_tokenizer" : {
#                         "type" : "nGram",
#                         "min_gram" : 1,
#                         "max_gram" : 100,
#                         "token_chars": [ "letter", "digit" ]
#                     }
#                 }
#             }
#         }
#     }

# ELASTICSEARCH_DEFAULT_ANALYZER = 'my_ngram_analyzer'

# ELASTICSEARCH_DEFAULT_TOKENIZER = 'my_ngram_tokenizer'

SEO_MODEL_REGISTRY = (
    ('test_project.MyMetadata', ('template_test', )),

)