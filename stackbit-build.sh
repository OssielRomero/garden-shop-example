#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eb747d0f05012001973678e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eb747d0f05012001973678e
curl -s -X POST https://api.stackbit.com/project/5eb747d0f05012001973678e/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eb747d0f05012001973678e/webhook/build/publish > /dev/null
