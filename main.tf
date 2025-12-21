terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.82.2"
    }
  }

  backend "s3" {
    # Add -backend-config="bucket=obs-bucket-name" when running terraform init
    # bucket = "obs-bucket-name"
    key    = "terraform.tfstate"
    region = "la-north-2"
    endpoints = {
      s3 = "https://obs.la-north-2.myhuaweicloud.com"
    }

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "huaweicloud" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "registry" {
  source = "./modules/registry"
}

module "platform" {
  source = "./modules/platform"
}