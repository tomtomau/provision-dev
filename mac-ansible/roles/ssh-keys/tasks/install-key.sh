#!/usr/bin/env bash

KEY=$(cat ~/.ssh/id_rsa.pub)

curl -sSH "Authorization: token $GITHUB_TOKEN" --data "{\"title\":\"$KEY_TITLE\",\"key\":\"$KEY\"}" https://api.github.com/user/keys
