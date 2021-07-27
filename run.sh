#!/bin/sh -l
git config --global user.email "gitops-release@github.com"
git config --global user.name "Gitops Release User"
git clone https://$4@github.com/$5.git  infra-as-code
python replace-key.py --file $1 --key $2 --value $3
git add .
git commit -m"Release of key $2 in $1"
git push