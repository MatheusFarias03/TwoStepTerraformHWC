terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

# SWR.
resource "huaweicloud_swr_organization" "awesome_org" {
  name = var.organization_name
}

# Repos.
resource "huaweicloud_swr_repository" "awesome_repo" {
  organization = huaweicloud_swr_organization.awesome_org.id
  name = var.awesome_repo
}