#!/bin/bash

cd ../../backend
docker build -t 948003242781.dkr.ecr.us-east-1.amazonaws.com/mipaquete-test/backend .
eval $(aws ecr get-login --no-include-email --region us-east-1 --registry-ids 948003242781 --profile mipaquete-test)
docker push 948003242781.dkr.ecr.us-east-1.amazonaws.com/mipaquete-test/backend
aws ecs update-service --cluster mipaquete-test-cluster --service mipaquete-test-service --force-new-deployment