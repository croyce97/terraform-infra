#!/usr/bin/env bash
set -e

# ===== CONFIG =====
REGION="ap-southeast-1"
PROJECT="my-terraform"
ENV="dev"                     # dev | stg | prod

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

STATE_BUCKET="tfstate-${PROJECT}-${ENV}-${ACCOUNT_ID}"
LOCK_TABLE="tf-lock-${PROJECT}-${ENV}"

echo "Using account: $ACCOUNT_ID"
echo "Creating S3 bucket: $STATE_BUCKET"
echo "Creating DynamoDB table: $LOCK_TABLE"

# ===== CREATE S3 BUCKET =====
if aws s3api head-bucket --bucket "$STATE_BUCKET" 2>/dev/null; then
  echo "S3 bucket already exists"
else
  if [ "$REGION" = "us-east-1" ]; then
    aws s3api create-bucket --bucket "$STATE_BUCKET"
  else
    aws s3api create-bucket \
      --bucket "$STATE_BUCKET" \
      --region "$REGION" \
      --create-bucket-configuration LocationConstraint="$REGION"
  fi
  echo "S3 bucket created"
fi

# ===== CREATE DYNAMODB TABLE =====
if aws dynamodb describe-table --table-name "$LOCK_TABLE" --region "$REGION" >/dev/null 2>&1; then
  echo "DynamoDB table already exists"
else
  aws dynamodb create-table \
    --table-name "$LOCK_TABLE" \
    --region "$REGION" \
    --billing-mode PAY_PER_REQUEST \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH

  aws dynamodb wait table-exists \
    --table-name "$LOCK_TABLE" \
    --region "$REGION"

  echo "DynamoDB table created"
fi

echo "Done ✅"
echo
echo "Terraform backend config:"
echo "bucket         = \"$STATE_BUCKET\""
echo "dynamodb_table = \"$LOCK_TABLE\""
echo "region         = \"$REGION\""
