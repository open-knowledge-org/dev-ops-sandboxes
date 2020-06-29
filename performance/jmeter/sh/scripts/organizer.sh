#!/bin/bash

### Imports
source sh/scripts/global-variables.sh

#
# Packing and Removing Flat Files
#
function packingFilesRemoveAfter(){
    sudo zip -r $SCENARIO_NAME.zip $EXECUTION_PATH
    sudo mv $SCENARIO_NAME.zip $HOST_LOGS_DIR
    sudo rm -r $EXECUTION_PATH
}
