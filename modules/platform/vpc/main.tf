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


# Subnets.
resource "huaweicloud_vpc_subnet" "subnet_inside" {
  name = var.subnet_inside_name
  cidr = var.subnet_inside_cidr
  gateway_ip = var.subnet_inside_gateway_ip
  
  vpc_id = huaweicloud_vpc.vpc.id
  availability_zone = var.availability_zone
}
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