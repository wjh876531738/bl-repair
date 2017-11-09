from django.db import models

# Create your models here.

class Article(models.Model):
    article_title = models.CharField(max_length=50)
    article_content = models.TextField()
    article_desc = models.CharField(max_length=300)
    author_name = models.CharField(max_length=20)
    tags = models.ManyToManyField('Tag')

    def __str__(self):
        return self.article_title

class Tag(models.Model):
    tag_name = models.CharField(max_length=30)
    tag_type = models.IntegerField()

    TAG_TYPE_NOTE = 0
    TAG_TYPE_RECOMMEND = 1

    def __str__(self):
        if self.tag_type == self.TAG_TYPE_NOTE:
            return self.tag_name + ' note'
        elif self.tag_type == self.TAG_TYPE_RECOMMEND:
            return self.tag_name + ' recommend'
        else:
            return self.tag_name
