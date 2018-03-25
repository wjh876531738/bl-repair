from django import forms


class CommentForm(forms.Form):
    comment_content = forms.CharField(max_length=255, label='评论')
