
#!/bin/bash
set -eo pipefail
#ARTIFACT_BUCKET=$(cat bucket-name.txt)
aws cloudformation package --template-file lambda-layer-template.yaml --s3-bucket mipaquete-cfn-templates --output-template-file out.yml 
aws cloudformation deploy --template-file out.yml --stack-name mpr-prod-lambdaLayerAxios --tags project=mpr --capabilities CAPABILITY_NAMED_IAM  --parameter-overrides \
    ProjectName=mpr \
    EnvType=prod \
    LayerName=axios \
    LayerDescription="nodejs axios 1.1.3"