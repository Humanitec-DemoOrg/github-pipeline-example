resource "humanitec_resource_definition_criteria" "postgres_dev" {
  resource_definition_id = humanitec_resource_definition.postgres_dev.id
  env_id                 = var.dev_env
  app_id                 = humanitec_application.app.id
}

resource "humanitec_resource_definition_criteria" "mariadb_dev" {
  resource_definition_id = humanitec_resource_definition.mariadb_dev.id
  env_id                 = var.dev_env
  app_id                 = humanitec_application.app.id
}

resource "humanitec_resource_definition_criteria" "postgres_prod" {
  resource_definition_id = humanitec_resource_definition.postgres_prod.id
  env_id                 = var.prod_env
  app_id                 = humanitec_application.app.id
}

resource "humanitec_resource_definition_criteria" "mariadb_prod" {
  resource_definition_id = humanitec_resource_definition.mariadb_prod.id
  env_id                 = var.prod_env
  app_id                 = humanitec_application.app.id
}

resource "humanitec_resource_definition_criteria" "namespace" {
  resource_definition_id = humanitec_resource_definition.namespace.id
  res_id                 = "k8s-namespace"
  app_id                 = humanitec_application.app.id
}

