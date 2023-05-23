resource "humanitec_resource_definition_criteria" "postgres_dev" {
  resource_definition_id = humanitec_resource_definition.postgres_dev.id
  app_id                 = humanitec_application.app.id
}

resource "humanitec_resource_definition_criteria" "mariadb_dev" {
  resource_definition_id = humanitec_resource_definition.mariadb_dev.id
  app_id                 = humanitec_application.app.id
}

resource "humanitec_resource_definition_criteria" "postgres_prod" {
  resource_definition_id = humanitec_resource_definition.postgres_prod.id
  app_id                 = humanitec_application.app.id
}

resource "humanitec_resource_definition_criteria" "mariadb_prod" {
  resource_definition_id = humanitec_resource_definition.mariadb_prod.id
  app_id                 = humanitec_application.app.id
}
