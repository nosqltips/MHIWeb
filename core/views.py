from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout, login, authenticate
from django.contrib import messages
from django.shortcuts import redirect, render
from .models import MhiViewPersonToSpreadsheet, MhiPersonAssignments, MhiViewArNospace, MhiViewUnassigned, MhiViewAssignmentRole
from django.http import JsonResponse
import logging
from django.db.models import F
from .templatetags.custom_filters import replace_with_linebreak

logger = logging.getLogger(__name__)

def home(request):
    return render(request, 'core/home.html')


@login_required
def staff(request):
    # persons = MhiPerson.objects.all()
    persons = MhiViewPersonToSpreadsheet.objects.all()
    return render(request, 'core/staff.html', {'persons': persons})

def sort_data_staff(request):
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


@login_required
def ar_nospace(request):
    assignments = MhiViewArNospace.objects.all()
    return render(request, 'core/ar_nospace.html', {'assignments': assignments})

def sort_data_nospace(request):
    column = request.GET.get('order_by', 'id')
    order = request.GET.get('order', 'asc')

    if order == 'desc':
        column = '-' + column

    queryset = MhiViewArNospace.objects.all().order_by(column)
    data = list(queryset.values())

    return JsonResponse({'data': data})


@login_required
def assignments(request):
    assignments = MhiPersonAssignments.objects.all()
    return render(request, 'core/assignments.html', {'assignments': assignments})

def sort_data_assgnments(request):
    column = request.GET.get('order_by', 'id')
    order = request.GET.get('order', 'asc')

    if order == 'desc':
        column = '-' + column

    queryset = MhiPersonAssignments.objects.all().order_by(column)
    data = list(queryset.values())

    return JsonResponse({'data': data})


@login_required
def unassigned(request):
    unassigneds = MhiViewUnassigned.objects.all()
    return render(request, 'core/unassigned.html', {'unassigneds': unassigneds})

def sort_data_unassigned(request):
    column = request.GET.get('order_by', 'id')
    order = request.GET.get('order', 'asc')

    if order == 'desc':
        column = '-' + column

    queryset = MhiViewUnassigned.objects.all().order_by(column)
    data = list(queryset.values())

    return JsonResponse({'data': data})


@login_required
def assignment_role(request):
    assignments = MhiViewAssignmentRole.objects.all()
    return render(request, 'core/assignment_role.html', {'assignments': assignments})

def sort_data_assignment_role(request):
    column = request.GET.get('order_by', 'assignment_id')
    order = request.GET.get('order', 'asc')

    if order == 'desc':
        column = '-' + column

    queryset = MhiViewAssignmentRole.objects.all().order_by(column)
    data = list(queryset.values())

    return JsonResponse({'data': data})


@login_required
def person_contact(request):
    # persons = MhiPerson.objects.all()
    persons = MhiViewPersonToSpreadsheet.objects.all()
    return render(request, 'core/contacts.html', {'persons': persons})


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
