#!/usr/bin/env bash
set -e

export DELTA=`score-humanitec delta --api-url $HUMANITEC_URL --token $HUMANITEC_TOKEN --org $HUMANITEC_ORG --app $HUMANITEC_APP --env $HUMANITEC_ENVIRONMENT -f score.debug.yaml --extensions extensions.debug.yaml --overrides overrides.debug.yaml | jq 'del(.metadata.url)'`
echo "NEW DELTA"
echo $DELTA
echo $DELTA| jq > /tmp/new_delta.txt

echo "CURRENT SET"
curl -s \
  "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/apps/${HUMANITEC_APP}/envs/${HUMANITEC_ENVIRONMENT}" \
  -H "Authorization: Bearer ${HUMANITEC_TOKEN}"

CURRENT_SET_ID="$(curl -s \
  "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/apps/${HUMANITEC_APP}/envs/${HUMANITEC_ENVIRONMENT}" \
  -H "Authorization: Bearer ${HUMANITEC_TOKEN}" | jq -r .last_deploy.set_id)"

CURRENT_DELTA_ID="$(curl -s \
  "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/apps/${HUMANITEC_APP}/envs/${HUMANITEC_ENVIRONMENT}" \
  -H "Authorization: Bearer ${HUMANITEC_TOKEN}" | jq -r .last_deploy.delta_id)"


echo "Current SET ID"
echo $CURRENT_SET_ID
echo "Current DELTA ID"
echo $CURRENT_DELTA_ID

curl -s \
  "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/apps/${HUMANITEC_APP}/deltas/${CURRENT_DELTA_ID}" \
  -H "Authorization: Bearer ${HUMANITEC_TOKEN}" | jq > /tmp/delta.txt


# # Apply the delta from the Score file to that deployment set returning the new set ID

NEW_SET_ID="$(curl -s \
  -X POST \
  "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/apps/${HUMANITEC_APP}/sets/${CURRENT_SET_ID}" \
  -H "Authorization: Bearer ${HUMANITEC_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${DELTA}" | jq -r .)"

echo $NEW_SET_ID

# Diff the new to the current deployment set and output the result
curl -s \
  "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/apps/${HUMANITEC_APP}/sets/${NEW_SET_ID}/diff/${CURRENT_SET_ID}" \
  -H "Authorization: Bearer ${HUMANITEC_TOKEN}" \
  -H "Content-Type: application/json" | jq > /tmp/diff.txt