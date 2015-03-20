#!/bin/sh

set -e

KIBANA_ES_URL=${KIBANA_ES_URL:-http://elasticsearch:9200}
KIBANA_INDEX=${KIBANA_INDEX:-kibana-int}
KIBANA_DIR=/opt/kibana-${KIBANA_VERSION}-linux-x64

sed -i "s;^elasticsearch:.*;elasticsearch: ${KIBANA_ES_URL};" "${KIBANA_DIR}/config/kibana.yml"
sed -i "s;^kibana_index:.*;kibana_index: ${KIBANA_INDEX};" "${KIBANA_DIR}/config/kibana.yml"

exec ${KIBANA_DIR}/bin/kibana
