resource "humanitec_resource_definition" "postgres_dev" {
  driver_type = "humanitec/template"
  id          = "${var.HUMANITEC_APP}-postgres-dev"
  name        = "${var.HUMANITEC_APP}-postgres-dev"
  type        = "postgres"

  driver_inputs = {
    secrets = {
      templates = jsonencode({
        cookie    = ""
        init      = ""
        manifests = ""
        outputs   = <<EOL
password: d0_n07_h4r0K0d3_U23_73H_S3cr372_m4n493R_0P3r470r
username: analytics_dev
EOL
      })
    },
    values = {
      templates = jsonencode({
        cookie    = ""
        init      = ""
        manifests = ""
        outputs   = <<EOL
host: postgres-dev.example.com
name: analytics
port: 5432
size: small
EOL
      })
    }
  }

  criteria = [
    {
      app_id = humanitec_application.app.id
      env_id = var.dev_env
    }
  ]

}

resource "humanitec_resource_definition" "mariadb_dev" {
  driver_type = "humanitec/template"
  id          = "${var.HUMANITEC_APP}-mariadb-dev"
  name        = "${var.HUMANITEC_APP}-mariadb-dev"
  type        = "mariadb"

  driver_inputs = {
    secrets = {
      templates = jsonencode({
        cookie    = ""
        init      = ""
        manifests = ""
        outputs   = <<EOL
password: d0_n07_h4r0K0d3_U23_73H_S3cr372_m4n493R_0P3r470r
username: products_dev
EOL
      })
    },
    values = {
      templates = jsonencode({
        cookie    = ""
        init      = ""
        manifests = ""
        outputs   = <<EOL
host: mariadb-dev.example.com
name: products
port: 3306
size: small
EOL
      })
    }
  }

  criteria = [
    {
      app_id = humanitec_application.app.id
      env_id = var.dev_env
    }
  ]

}
