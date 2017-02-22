#!/bin/bash

URL="https://allejo-surge_test-$TRAVIS_PULL_REQUEST.surge.sh"

npm install -g surge

surge --project ./_site --domain "$URL"

curl -u allejo:$GITHUB_PR_TOKEN --data "{\"state\":\"success\",\"target_url\":\"$URL\",\"description\":\"See a website preview\",\"context\":\"surge.sh/deploy\"}" "https://api.github.com/repos/allejo/travis-to-surge-test/statuses/$TRAVIS_PULL_REQUEST_SHA"
