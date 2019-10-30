#!/bin/bash

cd ../../Microservicio_TCC
docker image build -t 468253634394.dkr.ecr.us-east-1.amazonaws.com/mipaquete-prod/tcc .
eval $(aws ecr get-login --no-include-email --region us-east-1 --registry-ids 468253634394 --profile mipaquete-prod)
docker image push 468253634394.dkr.ecr.us-east-1.amazonaws.com/mipaquete-prod/tcc
aws ecs update-service --cluster mipaquete-cluster --service mipaquete-prod-service --force-new-deployment --profile mipaquete-prod