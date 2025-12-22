terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

resource "huaweicloud_dns_zone" "awesome_zone" {
  name        = var.awesome_zone_name
  # email       = var.email
  zone_type   = "public"
  ttl         = 3000
  # description = var.description
}

resource "huaweicloud_dns_recordset" "a_record" {
  zone_id = huaweicloud_dns_zone.awesome_zone.id
  name = "www.${var.awesome_zone_name}"
  type = "A"
  ttl = 3000
  records = [ var.elb_eip ] 
}