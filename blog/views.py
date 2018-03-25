from django.shortcuts import render

from .models import Article, Tag, Comment
from .serializers import ArticleSerializer, TagSerializer

from markdown import markdown

from .forms import CommentForm
from rest_framework import viewsets


def index(request):
    articles = Article.objects.all()
    tags = Tag.objects.all().distinct()
    return render(request, 'blog/index.html',
                  {'articles': articles, 'tags': tags})


def show(request, article_id):
    article = Article.objects.get(id=article_id)
    article_content = markdown(article.article_content)
    tags = Tag.objects.all().distinct()

    # 文章点击次数 +1
    article.click_time += 1
    article.save()

    if request.method == 'POST':
        comment_form = CommentForm(request.POST)
        if comment_form.is_valid():
            comment_content = comment_form.cleaned_data['comment_content']

            commenter_ip = '111.111.111.111'
            Comment.objects.create(
                comment_content=comment_content,
                commenter_ip=commenter_ip,
                article=article)

            comment_form = CommentForm()
            return render(request, 'blog/show.html', {
                'article_title': article.article_title,
                'article_content': article_content,
                'tags': tags,
                'msg': '发布成功',
                'comment_form': comment_form})
        else:
            return render(request, 'blog/show.html', {
                'article_title': article.article_title,
                'article_content': article_content,
                'tags': tags,
                'msg': '发布成功',
                'comment_form': comment_form})

    else:
        comment_form = CommentForm()
        return render(request, 'blog/show.html', {
            'article_title': article.article_title,
            'article_content': article_content,
            'tags': tags,
            'comment_form': comment_form})


def tag(request, tag_id):
    tag = Tag.objects.get(id=tag_id)
    print(tag.id)
    print(tag.tag_name)
    print(tag.article_set.all())
    return render(request, 'blog/tag.html',
                  {'tag': tag, 'articles': tag.article_set.all()})


class ArticleViewSet(viewsets.ModelViewSet):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer


class TagViewSet(viewsets.ModelViewSet):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
