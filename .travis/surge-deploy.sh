#!/bin/bash

URL="https://allejo-surge_test-$TRAVIS_PULL_REQUEST.surge.sh"
if [ ! -f /usr/local/bin/surge ]; then npm install -g surge; fi
surge --project ./_site --domain "$URL" &> /dev/null
SURGE_STATUS=$?
STATUS=$([ $SURGE_STATUS -eq 0 ] && echo "success" || echo "error")
DESC=$([ $SURGE_STATUS -eq 0 ] && echo "Staging website deployed successfully" || echo "Staging website deployed failed")

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bash $DIR/pr_status.sh "$STATUS" "$DESC" "$URL"
