#!/usr/bin/env bash

set -ex

TERRAFORM_VERSION="${TERRAFORM_VERSION:-0.14.0}"
TF_WORKSPACE="${TF_WORKSPACE:-default}"
TF_IN_AUTOMATION="${TF_IN_AUTOMATION:-1}"
TF_LOG="${TF_LOG:-INFO}"
TF_LOG_PATH="${TF_LOG_PATH:-terraform.log}"

python3 -c "import boto3" >/dev/null 2>&1 || exit 1
which terraform >/dev/null 2>&1 || exit 1

if [ ! -d "$(pwd)/.terraform" ]; then
  terraform init -input=false -get-plugins=true -get=true -upgrade=true -no-color
  terraform validate || exit -1
fi

terraform workspace select "${TF_WORKSPACE}" || exit -1
export TF_WORKSPACE="${TF_WORKSPACE}"

tfplan="${BUILD_ID}.${TF_WORKSPACE}.tfplan"
export tfplan
