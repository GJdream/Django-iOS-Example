from django.db import models
from django.contrib import admin

class Post(models.Model):
	title = models.CharField(max_length=60)
	content = models.TextField()
	published_date = models.DateTimeField(auto_now_add=True)

	def __unicode__(self):
		return u"%s" % (self.title)

class PostAdmin(admin.ModelAdmin):
	search_fields = ['title']

admin.site.register(Post, PostAdmin)