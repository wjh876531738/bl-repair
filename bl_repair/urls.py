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
from django.conf.urls import url, include
from django.contrib import admin

from django.views.generic import TemplateView

from rest_framework import routers
from rest_framework.documentation import include_docs_urls

from report import views as report_views
from blog import views as blog_views


# Router Api
router = routers.DefaultRouter()
# router.register(r'computer_problems', report_views.ComputerProblemViewSet)
# router.register(r'computers', report_views.ComputerViewSet)
# router.register(r'reporters', report_views.ReporterViewSet)
# router.register(r'tags', blog_views.TagViewSet)
# router.register(r'articles', blog_views.ArticleViewSet)

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'^$', report_views.new, name='root'),

    # Repair
    url(r'^report/index', report_views.index, name='report_index'),
    url(r'^report/about', report_views.about, name='report_about'),
    url(r'^report/new', report_views.new, name='report_new'),
    url(r'^api/v1/qrcode$', report_views.generate_qrcode,
        name='report_qrcode'),

    url(r'^api/v1/computer_problems', report_views.ComputerProblemList.as_view(), name='api_computer_problems'),
    url(r'^api/v1/computer_problem/(?P<pk>[0-9]+)$', report_views.ComputerProblemDetail.as_view(), name='api_computer_problem'),

    url(r'^api/v1/computers', report_views.ComputerList.as_view(), name='api_computers'),
    url(r'^api/v1/computer_classes', report_views.ComputerClassList.as_view(), name='api_computer_classes'),
    url(r'^api/v1/computer/(?P<pk>[0-9]+)$', report_views.ComputerDetail.as_view(), name='api_computer'),
    url(r'^api/v1/reminds', report_views.RemindList.as_view(), name='api_reminds'),
    url(r'^api/v1/remind/(?P<pk>[0-9]+)$', report_views.RemindDetail.as_view(), name='api_remind'),

    # Blog
    url(r'^articles', blog_views.index, name='article_index'),
    url(r'^article/(\d+)$', blog_views.show, name='article_show'),
    url(r'^article/tag/(\d+)$', blog_views.tag, name='article_tag'),

    # Api
    url(r'^api-auth/', include('rest_framework.urls')),
    url(r'^api-docs/', include_docs_urls(title="北理报障系统")),
    # url(r'^api/v1/', include(router.urls)),

    # Vue
    url(r'^zhbit/admin$', TemplateView.as_view(template_name='index.html')),

]
