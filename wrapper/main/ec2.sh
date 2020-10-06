#!/bin/bash

aws s3 cp ../modules/ec2/main.yml s3://cf-templates-45fczis6k7di-us-east-1/modules/ec2/main.yml

if [[ $1 == "deploy" ]]; then
 aws cloudformation create-stack --stack-name ec2-outputs  --template-body file://ec2.yml
fi

if [[ $1 == "destroy" ]]; then
 aws cloudformation delete-stack --stack-name ec2-outputs
fi

if [[ $1 == "update" ]]; then
 aws cloudformation update-stack --stack-name ec2-outputs --template-body file://ec2.yml
fi