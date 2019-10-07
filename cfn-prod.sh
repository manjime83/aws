#!/bin/bash

aws cloudformation package --template-file mipaquete.yaml --s3-bucket transadmin.co-cf-templates --output-template-file packaged.yaml
aws cloudformation deploy --template-file packaged.yaml --stack-name mipaquete-prod --capabilities CAPABILITY_NAMED_IAM --parameter-overrides \
    ProjectName=mipaquete \
    EnvType=prod \
    Domain=mipaquete.transadmin.co \
    SSLCertificate=arn:aws:acm:us-east-1:948003242781:certificate/6e982cdb-03f1-47aa-a826-978099ac3fbf \
    MinContainers=2 MaxContainers=4