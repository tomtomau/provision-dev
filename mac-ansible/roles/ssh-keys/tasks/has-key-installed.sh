#!/usr/bin/env bash

echo "Token: $GITHUB_TOKEN"
curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user/keys

# TODO: Jq

