# humanitec-pipeline-example

## Background:
This repository contains a pipeline example, how todefine resources, applications, and then deploy workloads to both `dev` and `prod` environments. The environment types must be defined, and they have to be named `development` (auto created by default), and `production`.

## Requeriments:
- Terraform Cloud Account (free tier is OK), workspace, organization and token (Terraform Cloud is used for the Humanitec Resource Definitons state storage only)
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
