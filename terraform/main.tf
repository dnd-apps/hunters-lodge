terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "boop-ninja"

    workspaces {
      name = "hunters-lodge"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "s3" {
  source = "./modules/s3"
  bucket-name = var.project-name-dns-friendly
  env = "Production"
  project-name = var.project-name
}

module.s3.resource
