# Import variables.
variable "vpc_id" {
  type = string
}
variable "subnet_inside_ipv4_id" {
  type = string
}
variable "inside_namespace" {
  type = string
}
variable "awesome_deployment_name" {
  type = string
}


# Local variables.
variable "elb_name" {
  type = string
  default = "awesome-elb"
}
variable "elb_listener_name" {
  type = string
  default = "http-listener"
}
variable "elb_listener_description" {
  type = string
  default = "HTTP listener"
}
variable "elb_listener_protocol" {
  type = string
  default = "HTTP"
}
variable "protocol_port" {
  type = number
  default = 80
}

variable "elb_pool_awesome_name" {
  type = string
  default = "elb-pool-awesome"
}
variable "elb_pool_awesome_protocol" {
  type = string
  default = "HTTP"
}
variable "elb_pool_awesome_method" {
  type = string
  default = "ROUND_ROBIN"
}

variable "awesome_pool_binding_name" {
  type = string
  default = "awesome-pool-binding"
}