#!/bin/bash

SERIAL=$(ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}')

ssh-keygen -t rsa -b 4096 -C "daniel.flook@ovoenergy.com ($SERIAL)" -f $HOME/.ssh/id_rsa -N "" -q

TITLE="Macbook $SERIAL"
KEY_DATA=$(<$HOME/.ssh/id_rsa.pub)

echo "MFA Code:"
read OTP

curl -v --user danielflookovo \
    --data "{\"title\":\"$TITLE\",\"key\":\"$KEY_DATA\"}" \
    --header "x-github-otp: $OTP" \
    https://api.github.com/user/keys

echo "Enable SSO for $TITLE"
open https://github.com/settings/keys
echo "press return"
read

mkdir -p repos
cd repos
git clone git@github.com:danielflookovo/macbook.git
