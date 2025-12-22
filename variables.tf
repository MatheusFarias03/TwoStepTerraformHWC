# Import variables
variable "access_key" {
  type      = string
  sensitive = true
}

variable "secret_key" {
  type      = string
  sensitive = true
}


# Local variables
variable "region" {
  type    = string
  default = "la-north-2"
}
variable "organization_name" {
  type = string
  default = "awesome-org"
}

variable "awesome_repo" {
  type = string
  default = "awesome-repo"
}