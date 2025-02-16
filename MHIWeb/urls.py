"""
URL configuration for MHIWeb project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
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
from core import views as core_views
from django.contrib.auth import views as auth_views
from core.admin import admin_site
from django.urls import path

urlpatterns = [
    path('admin/', admin_site.urls),
    path('', core_views.home, name='home'),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', core_views.custom_logout, name='logout'),

    path('staff/', core_views.staff, name='staff'),
    path('sort_data_staff/', core_views.sort_data_staff, name='sort_data_staff'),
    path('assignments/', core_views.assignments, name='assignments'),
    path('sort_data_assgnments/', core_views.sort_data_staff, name='sort_data_assignments'),
    path('ar_nospace/', core_views.ar_nospace, name='ar_nospace'),
    path('sort_data_nosqpce/', core_views.sort_data_nospace, name='sort_data_nospace'),
    path('unassigned/', core_views.unassigned, name='unassigned'),
    path('sort_data_unassigned/', core_views.sort_data_unassigned, name='sort_data_unassigned'),
    path('assignment_role/', core_views.assignment_role, name='assignment_role'),
    path('sort_data_assignment_role/', core_views.sort_data_assignment_role, name='sort_data_assignment_role'),

    path('contact/', core_views.person_contact, name='person_contact'),
]