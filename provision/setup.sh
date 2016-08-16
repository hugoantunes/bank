#!/bin/bash

# Script to set up a Django project on Vagrant.

# Installation settings

DB_NAME='bank'

# Install essential packages from Apt
#apt-get update -y
# Python dev packages
apt-get install -y build-essential python python3-dev
# python-setuptools being installed manually
wget https://bootstrap.pypa.io/ez_setup.py -O - | python3.4
# Dependencies for image processing with Pillow (drop-in replacement for PIL)
# supporting: jpeg, tiff, png, freetype, littlecms
# (pip install pillow to get pillow itself, it is not in requirements.txt)
apt-get install -y libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev
# Git (we'd rather avoid people keeping credentials for git commits in the repo, but sometimes we need it for pip requirements that aren't in PyPI)
apt-get install -y git

# Postgresql
if ! command -v psql; then
    apt-get install -y postgresql libpq-dev
    # Create vagrant pgsql superuser
    su - postgres -c "createuser -s vagrant"
fi

# virtualenv global setup
if ! command -v pip; then
    easy_install -U pip
fi
if [[ ! -f /usr/local/bin/virtualenv ]]; then
    pip3.4 install virtualenv virtualenvwrapper stevedore virtualenv-clone
fi

# postgresql setup for project
{ # your 'try' block
  su - vagrant -c "createdb $DB_NAME"
} || { # your 'catch' block
    echo "database $DB_NAME already exist"
}