# Import variables.

variable "vpc_id" {
  type = string
}

variable "subnet_inside_ipv4_id" {
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