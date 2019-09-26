#!/bin/bash

aws cloudformation package --template-file mipaquete.yaml --output-template-file mipaquete-packaged.yaml --s3-bucket transadmin.co-cf-templates
aws cloudformation deploy --template-file mipaquete-packaged.yaml --s3-bucket transadmin.co-cf-templates --stack-name mipaquete-test --capabilities CAPABILITY_NAMED_IAM --parameter-overrides ProjectName=mipaquete EnvType=test Domain=test.mipaquete.transadmin.co
 