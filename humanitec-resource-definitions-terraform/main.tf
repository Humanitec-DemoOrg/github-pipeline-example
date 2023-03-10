variable "HUMANITEC_ORG" {}
variable "HUMANITEC_TOKEN" {}
variable "HUMANITEC_URL" { default = "" }
variable "HUMANITEC_APP" {}

resource "humanitec_application" "app" {
  id   = var.HUMANITEC_APP
  name = var.HUMANITEC_APP
}

# ENV TYPES MUST EXIST PRIOR - NOT MANAGED AT APP LEVEL

variable "dev_env" { default = "development" }

variable "prod_env" { default = "production" }
