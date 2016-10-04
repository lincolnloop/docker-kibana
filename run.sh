#!/bin/sh

set -e

KIBANA_ES_URL=${KIBANA_ES_URL:-http://elasticsearch:9200}
KIBANA_INDEX=${KIBANA_INDEX:-kibana-int}
KIBANA_DIR=/opt/kibana

sed -i "s;^elasticsearch_url:.*;elasticsearch_url: ${KIBANA_ES_URL};" "${KIBANA_DIR}/config/kibana.yml"
sed -i "s;^kibana_index:.*;kibana_index: ${KIBANA_INDEX};" "${KIBANA_DIR}/config/kibana.yml"

exec ${KIBANA_DIR}/bin/kibana
