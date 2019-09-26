#/bin/sh

cd ../../frontend
npm install --prod
npm run build
aws s3 sync dist s3://app.mipaquete.transadmin.co --delete --profile mipaquete-prod
aws cloudfront create-invalidation --distribution-id E1V3HVTXFWYGJM --paths "/*" --profile mipaquete-prod