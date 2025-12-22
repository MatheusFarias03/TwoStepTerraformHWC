terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

resource "huaweicloud_waf_cloud_instance" "waf_instance" {
  charging_mode = "postPaid"
  website = "hec-hk"
  enterprise_project_id = var.enterprise_project_id
}

resource "huaweicloud_waf_domain" "name" {
  domain = var.domain_name
  enterprise_project_id = var.enterprise_project_id
  website_name = var.website_name
  protect_status = 1 # 1 means enabled.

  server {
    client_protocol = "HTTPS"
    server_protocol = "HTTP"
    address = var.domain_name # Should be the IP or domain name of the server.
    port = 80
    type = "ipv4"
  }
}