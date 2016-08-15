from django.contrib import admin

from bank_user.models import User
from bank_user.forms import UserForm


class UserAdmin(admin.ModelAdmin):
    form = UserForm

    list_display = ['first_name', 'last_name', 'iban']
    search_fields = ['first_name', 'last_name', 'iban']

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        super(UserAdmin, self).save_model(request, obj, form, change)

admin.site.register(User, UserAdmin)