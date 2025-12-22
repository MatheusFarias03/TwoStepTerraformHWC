terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

module "vpc" {
  source = "./vpc"
}

module "lts" {
  source = "./lts"
}

module "cci" {
  source = "./cci"

  vpc_id = module.vpc.vpc_id

  subnet_inside_id = module.vpc.subnet_inside_id
  subnet_inside_ipv4_id = module.vpc.subnet_inside_ipv4_id
  secgroup_inside_id = module.vpc.secgroup_inside_id

  cci_log_group_id = module.lts.cci_log_group_id
  awesome_stream_id = module.lts.awesome_stream_id

  organization_name = var.organization_name
  awesome_repo = var.awesome_repo
}

module "dns" {
  source = "./dns"
  elb_eip = module.cci.elb_eip_address
}

module "database" {
  source = "./database"

  vpc_id = module.vpc.vpc_id
  availability_zone = module.vpc.availability_zone
  subnet_db_id = module.vpc.subnet_db_id
  sec_group_db_id = module.vpc.sec_group_db_id

  db_password = var.db_password
}