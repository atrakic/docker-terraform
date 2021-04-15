#!/usr/bin/env bash

set -euo pipefail

BUCKET=tf-bucket
MSG="hello world"
OBJ="$(LC_CTYPE=C tr -dc 'a-zA-Z0-9-_' < /dev/urandom | head -c12)" || true


echo "$MSG" | aws --endpoint-url=http://localhost:4566 s3 cp - s3://"$BUCKET"/"$OBJ"
aws --endpoint-url=http://localhost:4566 s3 cp s3://"$BUCKET"/"$OBJ" -
aws --endpoint-url=http://localhost:4566 s3 ls s3://"$BUCKET"
