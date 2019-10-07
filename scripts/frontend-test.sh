#/bin/sh

cd ../../frontend
npm install
NODE_OPTIONS='--max-old-space-size=4096' npm run build:test
aws s3 sync dist s3://app.test.mipaquete.transadmin.co --delete --profile mipaquete-test