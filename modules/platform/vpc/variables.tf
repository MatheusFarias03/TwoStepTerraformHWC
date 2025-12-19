# VPC general things.
variable "vpc_name" {
  default = "vpc-awesome"
  type = string
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type = string
}
variable "availability_zone" {
  default = "la-north-2a"
  type = string
}


# Subnet Inside.
variable "subnet_inside_name" {
  default = "subnet_inside"
  type = string
}
variable "subnet_inside_cidr" {
  default = "10.0.1.0/24"
  type = string
}
variable "subnet_inside_gateway_ip" {
    default = "10.0.1.1"
    type = string
}
variable "sec_group_inside_name" {
  default = "sec_group_inside"
  type = string
}


# Subnet DB.
variable "subnet_db_name" {
  default = "subnet_db"
  type = string
}
variable "subnet_db_cidr" {
  default = "10.0.2.0/24"
  type = string
}
variable "subnet_db_gateway_ip" {
  default = "10.0.2.1"
  type = string
}
variable "sec_group_db_name" {
  default = "sec_group_db"
}