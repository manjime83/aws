#!/bin/bash

aws cloudformation package --template-file mipaquete.yaml --s3-bucket aossas-cfn-templates --output-template-file packaged.yaml --profile aossas
aws cloudformation deploy --template-file packaged.yaml --stack-name mipaquete-test --capabilities CAPABILITY_NAMED_IAM --profile aossas --parameter-overrides \
    ProjectName=mipaquete \
    EnvType=test \
    Domain=test.mipaquete.com \
    MinContainers=0 MaxContainers=2
 