from django.conf.urls import url, include
from django.contrib import admin
from django.views.generic import RedirectView

from google_auth.views import login

admin.autodiscover()

urlpatterns = [
    url(r'^admin/login/$', login),
    url(r'^admin/', include(admin.site.urls), name='admin'),
    url(r'^$', RedirectView.as_view(url='/admin')),
    url('', include('social.apps.django_app.urls', namespace='social')),
]
