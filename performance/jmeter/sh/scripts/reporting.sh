#!/bin/bash

### Imports
source sh/scripts/global-variables.sh

#
# Generate Consolidated Report
#
function generateReport(){
    sudo $JMETER_LOCATION -g $JTL_PATH -o $HTML_PATH
}
