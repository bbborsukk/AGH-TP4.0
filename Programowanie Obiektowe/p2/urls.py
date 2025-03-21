"""p2 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from a2 import views
from django.urls import include
from a2.views import login_view, logout_view, register_view#, instrukcja

urlpatterns = [
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('register/', register_view, name='register'),
    path('newproject/', views.newproject, name='newproject'),
    path('admin/', admin.site.urls),
    path('', include('django.contrib.auth.urls')),
    path('', views.index, name='index'),
    path('<int:pk>/', views.detail, name = 'detail'),
   
]
