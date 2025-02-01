from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout, login, authenticate
from django.contrib import messages
from django.shortcuts import redirect, render
# from .models import MhiPerson
from .models import MhiViewPersonToSpreadsheet
from django.http import JsonResponse
import logging
from django.db.models import F
from .templatetags.custom_filters import replace_with_linebreak

logger = logging.getLogger(__name__)

def home(request):
    return render(request, 'core/home.html')


@login_required
def protected(request):
    # persons = MhiPerson.objects.all()
    persons = MhiViewPersonToSpreadsheet.objects.all()
    return render(request, 'core/protected.html', {'persons': persons})


def custom_logout(request):
    logout(request)
    messages.info(request, "You have been logged out successfully.")
    return redirect('login')


def user_login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('/')  # Redirect to home page after login
        else:
            # Handle invalid login
            return render(request, 'login.html', {'error': 'Invalid credentials'})
    return render(request, 'login.html')


def sort_data(request):
    column = request.GET.get('order_by', 'id')
    order = request.GET.get('order', 'asc')

    if order == 'desc':
        column = '-' + column

    queryset = MhiViewPersonToSpreadsheet.objects.all().order_by(column)
    data = list(queryset.values())

    # Apply the filter to the specific field that needs line breaks
    for item in data:
        if 'assignments' in item:
            item['assignments'] = replace_with_linebreak(item['assignments'])

    return JsonResponse({'data': data})
