from django.contrib import admin
from .models import Article, Tag

# Register your models here.

# Register your models here.

class ArticleAdmin(admin.ModelAdmin):
    list_display = ('article_title', 'author_name')
    search_fields = ['article_title', 'author_name']

class TagAdmin(admin.ModelAdmin):
    list_display = ('tag_name', 'tag_type')
    search_fields = ['tag_name', 'tag_type']

admin.site.register(Article, ArticleAdmin)
admin.site.register(Tag, TagAdmin)
