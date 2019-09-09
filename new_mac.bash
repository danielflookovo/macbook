#!/bin/bash

git config --global user.name "Daniel Flook"
git config --global user.email "daniel.flook@ovoenergy.com"
git config --global core.editor nano
git config --global credential.helper osxkeychain
git config --global commit.gpgsign true

tfswitch 0.12.8
