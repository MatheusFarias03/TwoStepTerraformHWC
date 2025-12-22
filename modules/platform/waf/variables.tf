# Import variables.
variable "enterprise_project_id" {
  type = string
}

# Local variables.
variable "website_name" {
  type = string
  default = "Awesome Inc."
}
variable "domain_name" {
  type = string
  default = "awesome.com.br"
}