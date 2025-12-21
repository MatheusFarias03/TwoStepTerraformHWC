terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

resource "huaweicloud_lts_group" "cci_log_group" {
  group_name  = var.lts_group_name
  ttl_in_days = var.ttl_in_days
}

resource "huaweicloud_lts_stream" "awesome_stream" {
  group_id = huaweicloud_lts_group.cci_log_group.id
  stream_name = var.awesome_stream_name
}