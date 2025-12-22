terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}


# VPC.
resource "huaweicloud_vpc" "vpc" {
  name = var.vpc_name
  cidr = var.vpc_cidr
}


# Subnet Inside.
resource "huaweicloud_vpc_subnet" "subnet_inside" {
  name = var.subnet_inside_name
  cidr = var.subnet_inside_cidr
  gateway_ip = var.subnet_inside_gateway_ip
  
  vpc_id = huaweicloud_vpc.vpc.id
  availability_zone = var.availability_zone
}

# Subnet DB.
resource "huaweicloud_vpc_subnet" "subnet_db" {
  name = var.subnet_db_name
  cidr = var.subnet_db_cidr
  gateway_ip = var.subnet_db_gateway_ip
  
  vpc_id = huaweicloud_vpc.vpc.id
  availability_zone = var.availability_zone
}


# Security Group - Inside.
resource "huaweicloud_networking_secgroup" "sec_group_inside" {
  name = var.sec_group_inside_name
  description = "Security group of Inside subnet"
}
resource "huaweicloud_networking_secgroup_rule" "allow_inside_conn" {
  security_group_id = huaweicloud_networking_secgroup.sec_group_inside.id
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  ports = "80"
  remote_ip_prefix = "10.0.0.0/24"
}


# Security Group - Database.
resource "huaweicloud_networking_secgroup" "sec_group_db" {
  name = var.sec_group_db_name
  description = "Security group to connect to DB."
}
resource "huaweicloud_networking_secgroup_rule" "allow_db_conn" {
  security_group_id = huaweicloud_networking_secgroup.sec_group_db.id
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  ports = "5432"
  remote_ip_prefix = "10.0.1.0/24"
}


# VPCEP for OBS.
data "huaweicloud_vpcep_service_summary" "vpcep_obs" {
  endpoint_service_name = "la-north-2.com.myhuaweicloud.v4.obsv2"
}
resource "huaweicloud_vpcep_endpoint" "vpcep_obs" {
  service_id = data.huaweicloud_vpcep_service_summary.vpcep_obs.id
  vpc_id = huaweicloud_vpc.vpc.id
  network_id = huaweicloud_vpc_subnet.subnet_inside.id
}


# VPCEP for SWR.
data "huaweicloud_vpcep_service_summary" "vpcep_swr" {
  endpoint_service_name = "com.myhuaweicloud.la-north-2.swr"
}
resource "huaweicloud_vpcep_endpoint" "vpcep_swr" {
  service_id = data.huaweicloud_vpcep_service_summary.vpcep_swr.id
  vpc_id = huaweicloud_vpc.vpc.id
  network_id = huaweicloud_vpc_subnet.subnet_inside.id

  depends_on = [ huaweicloud_vpcep_endpoint.vpcep_obs ]
}