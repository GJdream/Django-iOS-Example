from django.conf.urls import patterns, include, url
from django.contrib import admin
from blog.api import PostResource

admin.autodiscover()

post_resource = PostResource()

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/', include(post_resource.urls)),
)
