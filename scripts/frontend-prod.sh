#/bin/sh

cd ../../frontend
npm install
NODE_OPTIONS='--max-old-space-size=4096' npm run build
aws s3 sync dist s3://app.mipaquete.transadmin.co --delete --profile mipaquete-prod
aws cloudfront create-invalidation --distribution-id E3UL4M7ZLV1RBR --paths "/*" --profile mipaquete-prod