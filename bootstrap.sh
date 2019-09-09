#!/bin/bash

SERIAL=$(ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}')

ssh-keygen -t rsa -b 4096 -C "daniel.flook@ovoenergy.com ($SERIAL)" -f $HOME/.ssh/id_rsa -N "" -q
gpg --batch --generate-key daniel-gpg

TITLE="Macbook $SERIAL"
SSH_KEY_DATA=$(<$HOME/.ssh/id_rsa.pub)
GPG_KEY_DATA=$(gpg --armor --export | tr '\n' '~' | sed 's/~/\\n/g')

echo "{\"armored_public_key\":\"$GPG_KEY_DATA\"}"

echo "MFA Code:"
read OTP

curl -v --user danielflookovo \
    --data "{\"title\":\"$TITLE\",\"key\":\"$SSH_KEY_DATA\"}" \
    --header "Content-Type: application/json" \
    --header "x-github-otp: $OTP" \
    https://api.github.com/user/keys

curl -v --user danielflookovo \
    --data "{\"armored_public_key\":\"$GPG_KEY_DATA\"}" \
    --header "Content-Type: application/json" \
    --header "x-github-otp: $OTP" \
    https://api.github.com/user/gpg_keys

echo "Enable SSO for $TITLE"
open https://github.com/settings/keys
echo "press return"
read

git clone git@github.com:danielflookovo/macbook.git .macbook
