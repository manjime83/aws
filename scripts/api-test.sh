#!/bin/bash

cd ../../api-mi-paquete
docker build -t 948003242781.dkr.ecr.us-east-1.amazonaws.com/mipaquete-test/api .
eval $(aws ecr get-login --no-include-email --region us-east-1 --registry-ids 948003242781 --profile mipaquete-test)
docker push 948003242781.dkr.ecr.us-east-1.amazonaws.com/mipaquete-test/api
aws ecs update-service --cluster mipaquete-test-cluster --service mipaquete-test-service --force-new-deployment #--profile mipaquete-test