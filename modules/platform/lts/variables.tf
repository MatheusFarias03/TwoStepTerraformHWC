variable "lts_group_name" {
  type = string
  default = "cci_log_group"
}

variable "ttl_in_days" {
  type = number
  default = 7
}

variable "awesome_stream_name" {
  type = string
  default = "awesome_stream"
}