#/bin/bash

user_name=""
user_email=""
editor=vim

git config --global user.name $user_name
git config --global user.email $user_email
git config --global core.editor $editor
git config --global init.defaultBranch main
