resource "humanitec_resource_definition" "namespace" {
  id          = "${var.HUMANITEC_APP}-namespace"
  name        = "${var.HUMANITEC_APP}-namespace"
  type        = "k8s-namespace"
  driver_type = "humanitec/template"

  driver_inputs = {
    values = {

      templates = jsonencode({
        init      = ""
        manifests = <<EOL
namespace:
  location: cluster
  data:
    apiVersion: v1
    kind: Namespace
    metadata:
      name: $${context.app.id}-$${context.env.id}

EOL
        outputs   = <<EOL
namespace: $${context.app.id}-$${context.env.id}
EOL
        cookie    = ""
      })
    }
    secrets = {
    }
  }

  lifecycle {
    ignore_changes = [
      criteria
    ]
  }

}
