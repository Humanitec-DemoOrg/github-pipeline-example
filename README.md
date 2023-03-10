# humanitec-pipeline-example

## Requeriments:
- Terraform Cloud Account (free tier is OK), workspace, organization and token (for state storare only)
- Humanitec Account, organization and token
- Github Account

### Steps:
- Create a GitHub repository, add an environment `development`
- Add the following variables:
    - HUMANITEC_APP
    - HUMANITEC_ORG 
    - HUMANITEC_TOKEN
    - TFC_ORG
    - TFC_TOKEN
    - TFC_WORKSPACE
- Make sure your app name is lowercase, and only dashes ex `demo-app`
