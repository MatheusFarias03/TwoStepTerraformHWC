terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

# RDS - Awesome.
resource "huaweicloud_rds_instance" "awesome" {
  vpc_id = var.vpc_id
  subnet_id = var.subnet_db_id
  security_group_id = var.sec_group_db_id
  availability_zone = [var.availability_zone]

  name = var.rds_awesome_name
  flavor = var.rds_flavor

  db {
    type = var.db_type
    version = var.db_version
    password = var.db_password
  }

  volume {
    type = var.volume_type
    size = var.volume_size
  }
}