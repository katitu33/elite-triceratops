#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e926d482550a600192dca1c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e926d482550a600192dca1c
curl -s -X POST https://api.stackbit.com/project/5e926d482550a600192dca1c/webhook/build/ssgbuild > /dev/null
npm run build
curl -s -X POST https://api.stackbit.com/project/5e926d482550a600192dca1c/webhook/build/publish > /dev/null
