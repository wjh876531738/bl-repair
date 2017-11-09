from django.shortcuts import render
from .models import Article, Tag

from markdown import markdown

# Create your views here.

def index(request):
    articles = Article.objects.all() 
    tags = Tag.objects.all().values('tag_name').distinct()
    return render(request, 'blog/index.html', { 'articles': articles, 'tags': tags }) 

def show(request, article_id): 
    article_content = Article.objects.get(id=article_id).article_content
    article_content = markdown(article_content)
    tags = Tag.objects.all().values('tag_name').distinct()
    return render(request, 'blog/show.html', { 'article_content': article_content, 'tags': tags }) 
