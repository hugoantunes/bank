#!/bin/bash

PROJECT_NAME='bank'
PROJECT_DIR=/home/vagrant/$PROJECT_NAME
VIRTUALENV_DIR=/home/vagrant/.virtualenvs/$PROJECT_NAME

# clone project
if [[ ! -f $PROJECT_NAME ]]; then
    git clone https://github.com/hugoantunes/bank.git
fi
su - vagrant -c "cd $PROJECT_DIR && git pull"

# virtualenv setup for project
su - vagrant -c "/usr/local/bin/virtualenv $VIRTUALENV_DIR --python=/usr/bin/python3.4 && \
    echo $PROJECT_DIR > $VIRTUALENV_DIR/.project && \
    $VIRTUALENV_DIR/bin/pip install -r $PROJECT_DIR/requirements.txt"


# Set execute permissions on manage.py, as they get lost if we build from a zip file
chmod a+x $PROJECT_DIR/app/manage.py

# Django project setup
su - vagrant -c "source $VIRTUALENV_DIR/bin/activate && cd $PROJECT_DIR && python app/manage.py migrate"
{ # your 'try' block
    su - vagrant -c "source $VIRTUALENV_DIR/bin/activate && cd $PROJECT_DIR && python app/manage.py runserver 0.0.0.0:8080 &"
    echo "###############################################"
    echo "access: http://localhost:8000/"
    echo "###############################################"
} || { # your 'catch' block
    echo "###############################################"
    echo "access: http://localhost:8000/"
    echo "###############################################"
}
