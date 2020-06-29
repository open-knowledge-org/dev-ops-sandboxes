### Imports
source sh/scripts/global-variables.sh
source sh/scripts/pre-requirements.sh
source sh/scripts/jmeter-test.sh
source sh/scripts/organizer.sh
source sh/scripts/reporting.sh
source sh/scripts/integrations.sh

# Pre-Requirements Check
executePreRequirementsCheck

# Run Test
executeTest

# Generate Consolidated Report
generateReport

# Packing and Removing Flat Files
packingFilesRemoveAfter

# Storing Files on S3
# saveOnS3
