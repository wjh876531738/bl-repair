from django.db import models

class Article(models.Model):
    article_title = models.CharField(max_length=50)
    article_content = models.TextField()
    article_desc = models.CharField(max_length=255)
    author_name = models.CharField(max_length=20)
    click_time = models.IntegerField(default=0)
    tags = models.ManyToManyField('Tag')

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.article_title


class Tag(models.Model):
    tag_name = models.CharField(max_length=30)

    TAG_TYPE_NOTE = 0
    TAG_TYPE_RECOMMEND = 1

    def __str__(self):
        return self.tag_name


class Comment(models.Model):
    article = models.ForeignKey('Article', on_delete=False)
    comment_content = models.CharField(max_length=255)
    commenter_ip = models.CharField(max_length=15)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.comment_content
