from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User, Group
from MHIWeb.admin import admin_site  # Import your custom admin site

# Register models with your custom admin site
admin_site.register(User, UserAdmin)
admin_site.register(Group)

# Register your own models here
# from .models import YourModel
# admin_site.register(YourModel)
