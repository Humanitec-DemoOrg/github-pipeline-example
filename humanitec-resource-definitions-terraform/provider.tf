terraform {
  required_providers {
    humanitec = {
      source = "humanitec/humanitec"
    }
  }
}

provider "humanitec" {
  disable_ssl_certificate_verification = false
  org_id                               = var.HUMANITEC_ORG
  token                                = var.HUMANITEC_TOKEN
  host                                 = var.HUMANITEC_URL == "" ? null : var.HUMANITEC_URL
}
