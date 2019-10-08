#!/bin/bash

cd ../../backend
docker image build -t 948003242781.dkr.ecr.us-east-1.amazonaws.com/mipaquete-prod/api .
eval $(aws ecr get-login --no-include-email --region us-east-1 --registry-ids 948003242781 --profile mipaquete-prod)
docker image push 948003242781.dkr.ecr.us-east-1.amazonaws.com/mipaquete-prod/api
aws ecs update-service --cluster mipaquete-cluster --service mipaquete-prod-service --force-new-deployment --profile mipaquete-prod