#!/bin/bash
BANK_GOOGLE_OAUTH2_KEY=''
BANK_GOOGLE_OAUTH2_SECRET=''

echo "##########################################################################################"
echo "                              export google auth keys                                     "
su - vagrant -c "echo export BANK_GOOGLE_OAUTH2_KEY=$BANK_GOOGLE_OAUTH2_KEY >> ~/.profile"
su - vagrant -c "echo export BANK_GOOGLE_OAUTH2_SECRET=$BANK_GOOGLE_OAUTH2_SECRET >> ~/.profile"
su - vagrant -c "cat ~/.profile"
echo "##########################################################################################"