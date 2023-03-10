#!/usr/bin/env bash 

mkdir -p ~/.terraform.d/
cat <<-EOF > ~/.terraform.d/credentials.tfrc.json
{
  "credentials": {
    "app.terraform.io": {
      "token": "$TFC_TOKEN"
    }
  }
}
EOF

touch tfcloud.tf
cat <<-EOL > tfcloud.tf
terraform {
  cloud {
    organization = "$TFC_ORG"
    workspaces {
      name = "$TFC_WORKSPACE"
    }
  }
}
EOL
