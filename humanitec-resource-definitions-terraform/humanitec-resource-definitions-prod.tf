resource "humanitec_resource_definition" "postgres_prod" {
  driver_type = "humanitec/static"
  id          = "${var.HUMANITEC_APP}-postgres-prod"
  name        = "${var.HUMANITEC_APP}-postgres-prod"
  type        = "postgres"

  driver_inputs = {
    secrets = {
      "password" : "d0_n07_h4r0K0d3_U23_73H_S3cr372_m4n493R_0P3r470r"
      "username" : "analytics_prod"
    },
    values = {
      "host" : "postgres-prod.example.com"
      "name" : "analytics"
      "port" : "5432"
    }
  }

  criteria = [
    {
      app_id = humanitec_application.app.id
      env_id = var.prod_env
    }
  ]

}

resource "humanitec_resource_definition" "mariadb_prod" {
  driver_type = "humanitec/static"
  id          = "${var.HUMANITEC_APP}-mariadb-prod"
  name        = "${var.HUMANITEC_APP}-mariadb-prod"
  type        = "mariadb"

  driver_inputs = {

    secrets = {
      "password" : "d0_n07_h4r0K0d3_U23_73H_S3cr372_m4n493R_0P3r470r",
      "username" : "products_prod"
    },
    values = {
      "host" : "mariadb-prod.example.com"
      "name" : "products"
      "port" : "3306"
    }

  }

  criteria = [
    {
      app_id = humanitec_application.app.id
      env_id = var.prod_env
    }
  ]

}
