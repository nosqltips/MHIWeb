from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout, login, authenticate
from django.contrib import messages
from django.shortcuts import redirect, render
from .models import MhiViewPersonToSpreadsheet, MhiPersonAssignments2, MhiViewArNospace, MhiViewUnassigned, MhiPersonContact, MhiViewAssignmentRoleAssigned
from django.http import JsonResponse
import logging
from django.db.models import F, Q
from .templatetags.custom_filters import replace_with_linebreak

logger = logging.getLogger(__name__)

def home(request):
    return render(request, 'core/home.html')

@login_required
def org_chart(request):
    return render(request, 'core/MHI_GNE_OrgChart_2024-07-23.html')

@login_required
def staff(request):
    # persons = MhiPerson.objects.all()
    persons = MhiViewPersonToSpreadsheet.objects.all()
    return render(request, 'core/staff.html', {'persons': persons})


def sort_data_staff(request):
    column = request.GET.get('order_by', 'id')
    order = request.GET.get('order', 'asc')
    search_query = request.GET.get('search', '')

    if order == 'desc':
        column = '-' + column

    queryset = MhiViewPersonToSpreadsheet.objects.all().order_by(column)

    if search_query:
        queryset = queryset.filter(
            Q(name__icontains=search_query) |
            Q(namefnf__icontains=search_query) |
            Q(type__icontains=search_query) |
            Q(portal__icontains=search_query) |
            Q(phone__icontains=search_query) |
            Q(email__icontains=search_query) |
            Q(address__icontains=search_query) |
            Q(area__icontains=search_query) |
            Q(ward__icontains=search_query) |
            Q(homeward__icontains=search_query) |
            Q(homestake__icontains=search_query) |
            Q(notes__icontains=search_query) |
            Q(assignments__icontains=search_query)  # Add all relevant fields here
        )

    data = list(queryset.values())

    # Apply the filter to the specific field that needs line breaks
    for item in data:
        if 'assignments' in item:
            item['assignments'] = replace_with_linebreak(item['assignments'])

    return JsonResponse({'data': data})

@login_required
def roles(request):
    roles = MhiViewArNospace.objects.all()
    return render(request, 'core/roles.html', {'roles': roles})

def sort_data_roles(request):
    column = request.GET.get('order_by', 'id')
    order = request.GET.get('order', 'asc')

    if order == 'desc':
        column = '-' + column

    queryset = MhiViewArNospace.objects.all().order_by(column)
    data = list(queryset.values())

    return JsonResponse({'data': data})


@login_required
def assignments(request):
    assignments = MhiPersonAssignments2.objects.all()
    return render(request, 'core/assignments.html', {'assignments': assignments})

def sort_data_assignments(request):
    column = request.GET.get('order_by', 'id')
    order = request.GET.get('order', 'asc')

    if order == 'desc':
        column = '-' + column

    queryset = MhiPersonAssignments2.objects.all().order_by(column)
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
    assignments = MhiViewAssignmentRoleAssigned.objects.all()
    return render(request, 'core/assignment_role.html', {'assignments': assignments})

def sort_data_assignment_role(request):
    column = request.GET.get('order_by', 'assignment_id')
    order = request.GET.get('order', 'asc')

    if order == 'desc':
        column = '-' + column

    queryset = MhiViewAssignmentRoleAssigned.objects.all().order_by(column)
    data = list(queryset.values())

    return JsonResponse({'data': data})


@login_required
def person_contact(request):
    # persons = MhiPerson.objects.all()
    contacts = MhiPersonContact.objects.all()
    return render(request, 'core/contacts.html', {'contacts': contacts})

def sort_data_contact(request):
    column = request.GET.get('order_by', 'id')
    order = request.GET.get('order', 'asc')

    if order == 'desc':
        column = '-' + column

    queryset = MhiPersonContact.objects.all().order_by(column)
    data = list(queryset.values())

    # Apply the filter to the specific field that needs line breaks
    for item in data:
        if 'assignments' in item:
            item['assignments'] = replace_with_linebreak(item['assignments'])

    return JsonResponse({'data': data})

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
