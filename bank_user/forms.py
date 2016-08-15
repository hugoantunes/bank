from django.forms import ModelForm
from localflavor.generic.forms import IBANFormField
from localflavor.generic.countries.sepa import IBAN_SEPA_COUNTRIES

from bank_user.models import User

'''
    The ideal should be use ISO_3166_1_ALPHA2_COUNTRY_CODES to validate all countries,
    but there is a bug in localflavor.
    I already open the issue
    https://github.com/django/django-localflavor/issues/241
'''


class UserForm(ModelForm):
    iban = IBANFormField(include_countries=IBAN_SEPA_COUNTRIES)

    class Meta:
        model = User
        fields = "__all__"