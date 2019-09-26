#/bin/sh

cd ../../frontend
npm install
npm run build:test
aws s3 sync dist s3://app.test.mipaquete.transadmin.co --delete --profile mipaquete-test