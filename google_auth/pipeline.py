
def set_access(backend, details, response, *args, **kwargs):
    user = kwargs.get("user")
    user.is_staff = True
    user.is_admin = True
    user.is_active = True
    user.save()
