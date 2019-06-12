#!/usr/bin/env bash

EXPECTED_KEY=$(cat ~/.ssh/id_rsa.pub | cut -d" " -f1,2)

curl -sSH "Authorization: token $GITHUB_TOKEN" https://api.github.com/user/keys | jq -ecMr ".[].key | select(. == \"${EXPECTED_KEY}\")"
