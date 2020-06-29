#!/bin/bash

### Imports
source sh/scripts/global-variables.sh

function createDirectories(){
    sudo mkdir -p $HOST_LOGS_DIR
    sudo mkdir -p $EXECUTION_PATH/report/data
    sudo mkdir -p $EXECUTION_PATH/report/html
}

function checkJMeterVersion(){
    $JMETER_LOCATION -v
}

function checkAwsClientVersion(){
    aws --version
}

function executePreRequirementsCheck(){
    createDirectories
    checkJMeterVersion
    #checkAwsClientVersion
}
