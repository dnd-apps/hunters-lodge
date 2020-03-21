#!/usr/bin/env bash

echo -e 'This is for local development only!!!!!!\n\n'

export AWS_REGION=us-east-1


#API_GATEWAY_ENDPOINT_URL="http://localhost:4567"
#CLOUDFORMATION_ENDPOINT_URL="http://localhost:4581"
#CLOUDWATCH_ENDPOINT_URL="http://localhost:4582"
#DYNAMODB_ENDPOINT_URL="http://localhost:4569"
#ES_ENDPOINT_URL="http://localhost:4578"
#FIREHOSE_ENDPOINT_URL="http://localhost:4573"
#IAM_ENDPOINT_URL="http://localhost:4593"
#KINISIS_ENDPOINT_URL="http://localhost:4568"
#LAMBDA_ENDPOINT_URL="http://localhost:4574"
#ROUTE53_ENDPOINT_URL="http://localhost:4580"
#REDSHIFT_ENDPOINT_URL="http://localhost:4577"
S3_ENDPOINT_URL="http://localhost:4572"
#SECRETS_MANAGER_ENDPOINT_URL="http://localhost:4584"
#SES_ENDPOINT_URL="http://localhost:4579"
#SNS_ENDPOINT_URL="http://localhost:4575"
#SQS_ENDPOINT_URL="http://localhost:4576"
#SSM_ENDPOINT_URL="http://localhost:4583"
#STEP_FUNCTIONS_ENDPOINT_URL="http://localhost:4585"
#STS_ENDPOINT_URL="http://localhost:4592"


echo "S3_ENDPOINT_URL: ${S3_ENDPOINT_URL}"

isEndpointUp() {
  check=$(curl -s --head  --request GET $1 | grep "200 OK" > /dev/null);
  if [[ check -eq 1 ]]; then
      echo "$1 is offline! make sure localstack is running!"
      exit 0
  fi
}

isEndpointUp $S3_ENDPOINT_URL

aws s3 --endpoint-url="${S3_ENDPOINT_URL}" mb s3://hunters-lodge

