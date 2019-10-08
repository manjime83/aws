#!/bin/bash

aws cloudformation package --template-file mipaquete.yaml --s3-bucket aossas-cfn-templates --output-template-file packaged.yaml --profile aossas
aws cloudformation deploy --template-file packaged.yaml --stack-name mipaquete-prod --capabilities CAPABILITY_NAMED_IAM --profile aossas --parameter-overrides \
    ProjectName=mipaquete \
    EnvType=prod \
    Domain=mipaquete.com \
    SSLCertificate=arn:aws:acm:us-east-1:468253634394:certificate/bbc6bb7c-c754-4581-9eb0-a07d96b2b8a6 \
    MinContainers=2 MaxContainers=4