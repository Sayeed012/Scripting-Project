#!/bin/bash

######################
# Author: Sayeed
# Date: 18th-Oct
#
# Version: v1
#
# This script will report simplified AWS resource usage
######################

set -x


# AWS S3 Buckets
echo "List of S3 Buckets:" | tee -a resourceTracker
aws s3 ls | awk '{print $3}' | tee -a resourceTracker

# AWS EC2 Instances
echo "List of EC2 Instance IDs and States:" | tee -a resourceTracker
aws ec2 describe-instances | jq -r '.Reservations[].Instances[] | {InstanceId, State: .State.Name}' | tee -a resourceTracker

# AWS Lambda Functions
echo "List of Lambda Function Names:" | tee -a resourceTracker
aws lambda list-functions | jq -r '.Functions[].FunctionName' | tee -a resourceTracker

# AWS IAM Users
echo "List of IAM User Names:" | tee -a resourceTracker
aws iam list-users | jq -r '.Users[].UserName' | tee -a resourceTracker
