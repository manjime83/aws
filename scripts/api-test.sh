#!/bin/bash

cd ../../backend
docker image build -t 468253634394.dkr.ecr.us-east-1.amazonaws.com/mipaquete-test/api .
eval $(aws ecr get-login --no-include-email --region us-east-1 --registry-ids 468253634394 --profile mipaquete-test)
docker image push 468253634394.dkr.ecr.us-east-1.amazonaws.com/mipaquete-test/api
aws ecs update-service --cluster mipaquete-cluster --service mipaquete-test-service --force-new-deployment --profile mipaquete-test