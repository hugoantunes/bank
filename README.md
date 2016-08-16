# Ruffus BANK

## about:
Django App that uses Google OAUTH2 as alternative login.


## important!
- add at bank/provision/google_auth.sh in lines 2,3
```bash
BANK_GOOGLE_OAUTH2_KEY='xxxxxxx'
BANK_GOOGLE_OAUTH2_SECRET='xxxxxxxx'
```
- if you don't have a api configured [click me](https://developers.google.com/identity/protocols/OAuth2)

## to start vagrant:
```bash
vagrant up
```
Will setup all dependencies and will start django app at localhost:8000

## dependencies:
- [postgreslq](https://www.postgresql.org/)
- [vagrant](https://www.vagrantup.com/downloads.html)
- [google api](https://console.developers.google.com)
