#!/bin/bash

aws cloudformation package --template-file mipaquete.yaml --s3-bucket transadmin.co-cf-templates --output-template-file mipaquete-packaged.yaml
aws cloudformation deploy --template-file mipaquete-packaged.yaml --stack-name mipaquete-prod --capabilities CAPABILITY_NAMED_IAM --parameter-overrides ProjectName=mipaquete EnvType=prod Domain=mipaquete.transadmin.co SSLCertificate=arn:aws:acm:us-east-1:948003242781:certificate/4f7ad330-1d3d-478f-94b1-622f631a05d9