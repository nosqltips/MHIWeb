from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User, Group
from MHIWeb.admin import admin_site  # Import your custom admin site
from .models import MhiPerson, MhiLuAssignment, MhiLuRole, MhiLanguage, MhiAreaWard, MhiAssignmentRole
from .models import MhiPersonAssignmentRole, MhiPersonContact, MhiPersonLanguage, MhiProcessTracking, MhiViewPersonToSpreadsheet

# Register models with your custom admin site
admin_site.register(User, UserAdmin)
admin_site.register(Group)

# Register your own models here
# from .models import YourModel
# admin_site.register(YourModel)
admin_site.register(MhiPerson)
admin_site.register(MhiLuAssignment)
admin_site.register(MhiLuRole)
admin_site.register(MhiLanguage)
admin_site.register(MhiAreaWard)
admin_site.register(MhiAssignmentRole)
admin_site.register(MhiPersonAssignmentRole)
admin_site.register(MhiPersonContact)
admin_site.register(MhiPersonLanguage)
admin_site.register(MhiProcessTracking)
admin_site.register(MhiViewPersonToSpreadsheet)
