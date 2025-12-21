terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }
}

module "vpc" {
  source = "./vpc"
}

module "lts" {
  source = "./lts"
}