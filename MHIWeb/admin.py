from django.contrib import admin
from django.contrib.admin import AdminSite

class MyAdminSite(AdminSite):
    # Text to put at the end of each page's <title>.
    site_title = 'MHI Granger East Web Admin'

    # Text to put in each page's <h1> (and above login form).
    site_header = 'MHI Granger East Web Administration'

    # Text to put at the top of the admin index page.
    index_title = 'Site Administration'


admin_site = MyAdminSite()