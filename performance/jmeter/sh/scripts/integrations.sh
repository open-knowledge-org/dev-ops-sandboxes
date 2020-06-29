#!/bin/bash

### Imports
source sh/scripts/global-variables.sh

#
# Storing Files on S3
#
function saveOnS3(){
    aws s3 cp $HOST_LOGS_DIR/$SCENARIO_NAME.zip s3://$S3_BUCKET
}

