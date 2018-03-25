from django.contrib import admin
from .models import Article, Tag, Comment


class ArticleAdmin(admin.ModelAdmin):
    list_display = ('id', 'article_title', 'author_name', 'created_at')
    search_fields = ('id', 'article_title', 'author_name')


class TagAdmin(admin.ModelAdmin):
    list_display = ('id', 'tag_name')
    search_fields = ('id', 'tag_name')


class CommentAdmin(admin.ModelAdmin):
    list_display = ('comment_content', 'commenter_ip', 'created_at')
    search_fields = ('comment_content', 'commenter_ip', 'created_at')


admin.site.register(Article, ArticleAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(Comment, CommentAdmin)
