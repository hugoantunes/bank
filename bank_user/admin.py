from django.contrib import admin

from bank_user.models import User
from bank_user.forms import UserForm


class UserAdmin(admin.ModelAdmin):
    form = UserForm

admin.site.register(User, UserAdmin)