output "awesome_deployment_name" {
  value = var.awesome_deployment_name
}
output "inside_namespace" {
  value = huaweicloud_cciv2_namespace.inside_namespace.name
}