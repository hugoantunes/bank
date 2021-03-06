from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType

from bank_user.models import User


def set_access(*args, **kwargs):
    user = kwargs.get("user")
    if user.is_staff and user.is_active:
        return
    user.is_staff = True
    user.is_active = True
    user.save()


def add_bank_user_permission(*args, **kwargs):
    user = kwargs.get("user")
    content_type = ContentType.objects.get_for_model(User)
    permissions = Permission.objects.filter(content_type=content_type)
    if not set(user.user_permissions.all()) == set(content_type.permission_set.all()):
        for permission in permissions:
            user.user_permissions.add(permission)
