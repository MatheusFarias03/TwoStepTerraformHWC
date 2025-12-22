# Import variables.

variable "subnet_inside_id" {
  type = string
}
variable "subnet_inside_ipv4_id" {
  type = string
}
variable "secgroup_inside_id" {
  type = string
}

variable "cci_log_group_id" {
  type = string
}
variable "awesome_stream_id" {
  type = string
}

variable "organization_name" {
  type = string
}
variable "awesome_repo" {
  type = string
}


# Local variables.

variable "awesome_deployment_name" {
  type = string
  default = "awesome_deployment"
}