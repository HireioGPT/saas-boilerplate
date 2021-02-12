#!/bin/bash

set -e

LOCALSTACK_URL=http://localstack:4566


function wait_for_s3 {
  until aws --region=eu-west-1 --endpoint-url="$LOCALSTACK_URL" s3 ls; do
    >&2 echo "S3 is unavailable - sleeping"
    sleep 1
  done
}
