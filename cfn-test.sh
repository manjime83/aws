#!/bin/bash

aws cloudformation package --template-file mipaquete.yaml --s3-bucket aossas-cfn-templates --output-template-file packaged.yaml --profile aossas
aws cloudformation deploy --template-file packaged.yaml --stack-name mipaquete-test --capabilities CAPABILITY_NAMED_IAM --profile aossas --parameter-overrides \
    ProjectName=mipaquete \
    EnvType=test \
    Domain=test.mipaquete.com \
    SSLCertificate=arn:aws:acm:us-east-1:468253634394:certificate/5e9beba9-97c2-4fef-9891-aee53f15f4bb \
    MinContainers=1 MaxContainers=2
aws cloudformation update-termination-protection --stack-name mipaquete-test --enable-termination-protection --profile aossas
 