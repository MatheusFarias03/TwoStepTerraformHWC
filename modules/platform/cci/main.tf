terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

data "huaweicloud_account" "awesome_account" {} 

module "deployments" {
  source = "./deployments"

  awesome_account_id = data.huaweicloud_account.awesome_account.id
  awesome_account_current_project_id = data.huaweicloud_account.awesome_account.current_project_id

  subnet_inside_id = var.subnet_inside_id
  subnet_inside_ipv4_id = var.subnet_inside_ipv4_id
  secgroup_inside_id = var.secgroup_inside_id

  cci_log_group_id = var.cci_log_group_id
  awesome_stream_id = var.awesome_stream_id

  organization_name = var.organization_name
  awesome_repo = var.awesome_repo
  awesome_deployment_name = var.awesome_deployment_name
}

module "services" {
  source = "./services"

  vpc_id = var.vpc_id
  subnet_inside_ipv4_id = var.subnet_inside_ipv4_id
}