# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class MhiPerson(models.Model):
    objects = models.Manager()
    person_id = models.AutoField(primary_key=True, blank=False, null=False)
    guid = models.TextField(blank=True, null=True)
    name_full_txt = models.TextField(blank=True, null=True)
    name_first_txt = models.TextField(blank=True, null=True)
    name_last_txt = models.TextField(blank=True, null=True)
    type_txt = models.TextField(blank=True, null=True)
    status_txt = models.TextField(blank=True, null=True)
    portal_number_txt = models.TextField(blank=True, null=True)
    phone_num = models.TextField(blank=True, null=True)
    email_txt = models.TextField(blank=True, null=True)
    address_txt = models.TextField(blank=True, null=True)
    address_street_txt = models.TextField(blank=True, null=True)
    address_city_txt = models.TextField(blank=True, null=True)
    address_state_txt = models.TextField(blank=True, null=True)
    address_zip_code_txt = models.TextField(blank=True, null=True)
    home_ward_txt = models.TextField(blank=True, null=True)
    home_stake_txt = models.TextField(blank=True, null=True)
    assignment = models.TextField(db_column='Assignment', blank=True, null=True)  # Field name made lowercase.
    role = models.TextField(db_column='Role', blank=True, null=True)  # Field name made lowercase.
    assigned_area_txt = models.TextField(blank=True, null=True)
    assigned_ward_txt = models.TextField(blank=True, null=True)
    note_txt = models.TextField(blank=True, null=True)
    last_edit_dt = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'mhi_person'


class MhiLuAssignment(models.Model):
    assignment_id = models.AutoField(primary_key=True, blank=False, null=False)
    assignment_code_txt = models.TextField(blank=True, null=True)
    assignment_desc_txt = models.TextField(blank=True, null=True)
    last_edit_dt = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'mhi_lu_assignment'


class MhiLuRole(models.Model):
    role_id = models.AutoField(primary_key=True, blank=False, null=False)
    role_code_txt = models.TextField(blank=True, null=True)
    role_desc_txt = models.TextField(blank=True, null=True)
    role_level_num = models.IntegerField(blank=True, null=True)
    last_edit_dt = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'mhi_lu_role'


class MhiLanguage(models.Model):
    language_id = models.AutoField(primary_key=True, blank=False, null=False)
    language_txt = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'mhi_language'


class MhiAreaWard(models.Model):
    area_ward_id = models.AutoField(primary_key=True, blank=False, null=False)
    person = models.ForeignKey('MhiPerson', on_delete=models.CASCADE, blank=True, null=True)
    area_nm = models.TextField(blank=True, null=True)
    ward_nm = models.TextField(blank=True, null=True)
    community_nm = models.TextField(blank=True, null=True)
    last_edit_dt = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'mhi_area_ward'


class MhiAssignmentRole(models.Model):
    assignment_role_id = models.AutoField(primary_key=True, blank=False, null=False)
    assignment = models.ForeignKey('MhiLuAssignment', models.CASCADE, blank=True, null=True)
    role = models.ForeignKey('MhiLuRole', models.CASCADE, blank=True, null=True)
    ar_report_to = models.ForeignKey('self', models.CASCADE, to_field=None, blank=True, null=True)
    last_edit_dt = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'mhi_assignment_role'


class MhiPersonAssignmentRole(models.Model):
    person_assignment_role_id = models.AutoField(primary_key=True, blank=False, null=False)
    person = models.ForeignKey(MhiPerson, models.CASCADE, blank=True, null=True)
    assignment_role = models.ForeignKey(MhiAssignmentRole, models.CASCADE, blank=True, null=True)
    assignment_role_seq = models.IntegerField(blank=True, null=True)
    assignment_dt = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        db_table = 'mhi_person_assignment_role'


class MhiPersonContact(models.Model):
    contact_id = models.AutoField(primary_key=True, blank=False, null=False)
    person = models.ForeignKey(MhiPerson, models.CASCADE, blank=True, null=True)
    contact_date = models.DateField(blank=True, null=True)
    contact_type_txt = models.TextField(blank=True, null=True)
    contact_purpose_txt = models.TextField(blank=True, null=True)
    contact_notes_txt = models.TextField(blank=True, null=True)
    last_edit_dt = models.DateField(blank=True, null=True)

    class Meta:
        db_table = 'mhi_person_contact'


class MhiPersonLanguage(models.Model):
    person_language_id = models.AutoField(primary_key=True, blank=False, null=False)
    person = models.ForeignKey(MhiPerson, models.CASCADE, blank=True, null=True)
    language = models.ForeignKey(MhiLanguage, models.CASCADE, blank=True, null=True)
    language_seq = models.IntegerField(blank=True, null=True)
    last_edit_dt = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'mhi_person_language'


class MhiProcessTracking(models.Model):
    process_track_id = models.AutoField(primary_key=True, blank=False, null=False)
    person = models.ForeignKey(MhiPerson, models.CASCADE, blank=True, null=True)
    missionary_portal_number_txt = models.TextField(blank=True, null=True)
    bishop_nm = models.TextField(blank=True, null=True)
    bishop_phone = models.TextField(blank=True, null=True)
    bishop_email = models.BinaryField(blank=True, null=True)
    stake_pres_nm = models.FloatField(blank=True, null=True)
    stake_pres_phone = models.BinaryField(blank=True, null=True)
    stake_pres_email = models.TextField(blank=True, null=True)
    call_volunteer_dt = models.DateField(blank=True, null=True)
    call_volunteer_letter_dt = models.DateField(blank=True, null=True)
    release_dt = models.DateField(blank=True, null=True)
    badge_ordered_yn = models.CharField(db_column='badge_ordered_YN', blank=True, null=True, max_length=1)  # Field name made lowercase.
    badge_received_yn = models.CharField(db_column='badge_received_YN', blank=True, null=True, max_length=1)  # Field name made lowercase.
    badge_received_dt = models.DateField(blank=True, null=True)
    missionary_portal_complete_dt = models.DateField(blank=True, null=True)
    last_edit_dt = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'mhi_process_tracking'


class MhiViewPersonToSpreadsheet(models.Model):
    objects = models.Manager()
    person_id = models.AutoField(primary_key=True, blank=False, null=False)
    name = models.TextField(blank=True, null=True)
    namefnf = models.TextField(blank=True, null=True)
    type = models.TextField(blank=True, null=True)
    portal = models.TextField(blank=True, null=True)
    phone = models.TextField(blank=True, null=True)
    email = models.TextField(blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    area = models.TextField(blank=True, null=True)
    ward = models.TextField(blank=True, null=True)
    homeward = models.TextField(blank=True, null=True)
    homestake = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    assignments = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'vw_person_to_spreadsheet'
