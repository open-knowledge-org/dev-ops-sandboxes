#
# Scenario Variables
#
SCENARIO_NAME=tie_empty_flow_$(date +%Y%m%d_%H%M%S)
JMX_FILE="jmx/scenario3.jmx"
#
# Host Associated Variables
#
JMETER_LOCATION=/opt/jmeter/5.1.1/bin/jmeter.sh
HOST_LOGS_DIR=/var/log/system/perf-test
EXECUTION_PATH=/var/log/system/perf-test/$SCENARIO_NAME
JTL_PATH=$EXECUTION_PATH/report/data/$SCENARIO_NAME.jtl
HTML_PATH=$EXECUTION_PATH/report/html
#
# Integration Variables
#
S3_BUCKET="system-reports"
#
# JMETER Global Variables
#
JMETER_system_SERVER_HOST="192.168.253.54"
JMETER_INFLUXDB_URL="http://192.168.253.54:8086/write?db=system&u=admin&p=admin"
JMETER_INFLUXDB_TEST_TITLE="system"
JMETER_INFLUXDB_APP_NAME="system"
JMETER_system_SERVER_PORT="9090"
JMETER_system_SERVER_PROTOCOL="http"
#
# JMETER Scenario Variables
#
JMETER_TARGET_CONCURRENCY="100"
JMETER_system_SERVER_PATH="/system"
JMETER_RAMP_UP_TIME="240"
JMETER_RAMP_UP_STEPS_COUNT="5"
JMETER_HOLD_TARGET_RATE_TIME="1"
JMETER_system_MESSAGE_EVENT="test-package-system"
JMETER_system_MESSAGE_ORIGIN="system"
JMETER_system_MESSAGE_TYPE="sync"
JMETER_system_REQUEST="{\"nrSeqTransmission\": 138908 }"
