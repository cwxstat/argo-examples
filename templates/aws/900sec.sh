#!/bin/bash
set -e

sts=( $(
    aws sts get-session-token --duration-seconds 900  \
    --query 'Credentials.[AccessKeyId,SecretAccessKey]' \
    --output text
) )
export TMP_AWS_ACCESS_KEY_ID=${sts[0]}
export TMP_AWS_SECRET_ACCESS_KEY=${sts[1]}
export TMP_AWS_DEFAULT_REGION='us-east-2'
