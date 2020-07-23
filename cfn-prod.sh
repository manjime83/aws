#!/bin/bash

aws cloudformation package --template-file mipaquete.yaml --s3-bucket aossas-cfn-templates --output-template-file packaged.yaml --profile aossas
aws cloudformation deploy --template-file packaged.yaml --stack-name mipaquete-prod --capabilities CAPABILITY_NAMED_IAM --profile aossas --parameter-overrides \
    ProjectName=mipaquete \
    EnvType=prod \
    Domain=mipaquete.com \
    SSLCertificate=arn:aws:acm:us-east-1:468253634394:certificate/21ddc356-2468-4271-b19d-775f3cf5a9b9 \
    MinContainers=2 MaxContainers=3
aws cloudformation update-termination-protection --stack-name mipaquete-prod --enable-termination-protection --profile aossas