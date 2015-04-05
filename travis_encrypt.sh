#!/bin/bash
# Encrypts private SSH keys for use in .travis.yml.
 
SSH_KEY_PATH=$1
 
if [[ ! $(which travis) ]]
then
  gem install travis
fi
 
travis login --auto

travis encrypt DIGITALOCEAN_ACCESS_TOKEN=${DIGITALOCEAN_ACCESS_TOKEN} --add
travis encrypt DIGITALOCEAN_SSH_KEY_IDS=${DIGITALOCEAN_SSH_KEY_IDS} --add

base64 ${SSH_KEY_PATH} | \
awk '{
  j=0;
  for( i=1; i<length; i=i+90 ) {
    system("travis encrypt DO_KEY_CHUNK_" j "=" substr($0, i, 90) " --add");
    j++;
  }
}'
