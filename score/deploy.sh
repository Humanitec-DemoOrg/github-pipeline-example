#!/usr/bin/env bash
set -e

export DELTA_ID=`score-humanitec delta --api-url $HUMANITEC_URL --token $HUMANITEC_TOKEN --org $HUMANITEC_ORG --app $HUMANITEC_APP --env $HUMANITEC_ENVIRONMENT -f score.debug.yaml --extensions extensions.debug.yaml --overrides overrides.debug.yaml | jq .id -r`

CURRENT_SET_ID="$(curl -s \
  "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/apps/${APP_ID}/envs/${HUMANITEC_ENVIRONMENT}" \
  -H "Authorization: Bearer ${HUMANITEC_TOKEN}" | jq -r .last_deploy.set_id)"

# Apply the delta from the Score file to that deployment set returning the new set ID
NEW_SET_ID="$(curl -s \
  -X POST \
  "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/apps/${APP_ID}/sets/${CURRENT_SET_ID}" \
  -H "Authorization: Bearer ${HUMANITEC_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${DELTA}" | jq -r .)"

# Diff the new to the current deployment set and output the result
curl -s \
  "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/apps/${APP_ID}/sets/${NEW_SET_ID}/diff/${CURRENT_SET_ID}" \
  -H "Authorization: Bearer ${HUMANITEC_TOKEN}" \
  -H "Content-Type: application/json" | jq > /tmp/diff.txt