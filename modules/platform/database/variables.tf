# Import variables.
variable "vpc_id" {
  type = string
}
variable "subnet_db_id" {
  type = string 
}
variable "sec_group_db_id" {
  type = string
}
variable "availability_zone" {
  type = string
}
variable "db_password" {
  type = string
  sensitive = true
}

# Local variables.
variable "rds_awesome_name" {
  type = string
  default = "rds-awesome"
}
variable "rds_flavor" {
    type = string
    default = "rds.pg.x1.large.2"
}
variable "db_type" {
  type = string
  default = "PostgreSQL"
}
variable "db_version" {
  type = string
  default = "17"
}
variable "volume_type" {
  type = string
  default = "CLOUDSSD"
}
variable "volume_size" {
  type = string
  default = "40"
}