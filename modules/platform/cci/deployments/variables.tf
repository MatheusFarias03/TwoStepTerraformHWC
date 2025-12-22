# Import variables.

## Import - Awesome Account.
variable "awesome_account_id" {
  type = string
}
variable "awesome_account_current_project_id" {
  type = string
}

## Import - Subnet Inside.
variable "subnet_inside_id" {
  type = string
}
variable "subnet_inside_ipv4_id" {
  type = string
}
variable "secgroup_inside_id" {
  type = string
}

## Import - LTS.
variable "cci_log_group_id" {
  type = string
}
variable "awesome_stream_id" {
  type = string
}

## Import - SWR.
variable "organization_name" {
  type = string
}
variable "awesome_repo" {
  type = string
}


# Local variables.

## Awesome deployment.

variable "awesome_deployment_name" {
  type = string
  default = "awesome_deployment"
}