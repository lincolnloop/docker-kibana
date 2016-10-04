#!/bin/sh

set -e

KIBANA_ES_URL=${KIBANA_ES_URL:-http://elasticsearch:9200}
KIBANA_DIR=/opt/kibana

echo "elasticsearch_url: ${KIBANA_ES_URL};" >> "${KIBANA_DIR}/config/kibana.yml"

exec ${KIBANA_DIR}/bin/kibana
