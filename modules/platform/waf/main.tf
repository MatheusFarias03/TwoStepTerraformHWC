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