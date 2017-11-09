"""bl_repair URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin

from django.views.generic import TemplateView

from report import views as report_views
from blog import views as blog_views

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'^$', blog_views.index, name='root'),

    # Repair
    url(r'^report/new', report_views.new, name='report_new'),
    url(r'^report/qrcode$', report_views.generate_qrcode, name='report_qrcode'),

    # Blog
    url(r'^articles', blog_views.index, name='article_index'),
    url(r'^article/(\d+)$', blog_views.show, name='article_show'),

    # Vue
    url(r'^vue$', TemplateView.as_view(template_name='index.html')),

]
