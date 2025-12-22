terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

# Application ELB Elastic flavors.
data "huaweicloud_elb_flavors" "l7_flavors" {
  type            = "L7_elastic"
}

# EIP for the ELB.
resource "huaweicloud_vpc_eip" "elb_eip" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    share_type  = "PER"
    name        = var.elb_name
    size        = 300
    charge_mode = "traffic"
  }
}

# ELB.
resource "huaweicloud_elb_loadbalancer" "awesome_elb" {
  name = var.elb_name
  cross_vpc_backend = true

  vpc_id = var.vpc_id
  ipv4_subnet_id = var.subnet_inside_ipv4_id
  l7_flavor_id   = data.huaweicloud_elb_flavors.l7_flavors.flavors[0].id

  availability_zone = [
    "la-north-2a",
    "la-north-2b",
    "la-north-2c"
  ]

  ipv4_eip_id = huaweicloud_vpc_eip.elb_eip.id
}

# ELB Listener.
resource "huaweicloud_elb_listener" "elb_listener" {
  name            = var.elb_listener_name
  description     = var.elb_listener_description
  protocol        = var.elb_listener_protocol
  protocol_port   = var.protocol_port
  loadbalancer_id = huaweicloud_elb_loadbalancer.wave_elb.id

  idle_timeout     = 60
  request_timeout  = 60
  response_timeout = 60

  advanced_forwarding_enabled = true
}

