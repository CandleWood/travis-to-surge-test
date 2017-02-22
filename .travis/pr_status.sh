#!/bin/bash

STATUS=$1
DESC=$2
URL=$3

curl -u $GITHUB_USER:$GITHUB_PR_TOKEN --data "{\"state\":\"$STATUS\",\"target_url\":\"$URL\",\"description\":\"$DESC\",\"context\":\"surge.sh/staging\"}" "https://api.github.com/repos/$GITHUB_REPO/statuses/$TRAVIS_PULL_REQUEST_SHA"
