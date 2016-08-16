from django.test import TestCase
from django.contrib.contenttypes.models import ContentType
from django.contrib.auth.models import User as AdminUser

from google_auth.pipeline import set_access, add_bank_user_permission
from bank_user.models import User


class PipelineTest(TestCase):
    def setUp(self):
        self.admin_user = AdminUser.objects.create_user(
            username='admin',
            email='admin@…',
            password='top_secret'
        )
        self.admin_user.is_staff = False
        self.admin_user.is_active = False
        self.admin_user.save()

    def test_set_access(self):
        set_access(user=self.admin_user)

        self.admin_user = AdminUser.objects.get()
        self.assertTrue(self.admin_user.is_staff)
        self.assertTrue(self.admin_user.is_active)

    def test_add_bank_user_permission(self):
        content_type = ContentType.objects.get_for_model(User)
        add_bank_user_permission(user=self.admin_user)

        self.admin_user = AdminUser.objects.get()
        self.assertTrue(
            set(self.admin_user.user_permissions.all()) == set(content_type.permission_set.all())
        )
