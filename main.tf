terraform {
  backend "remote" {
    organization = "KakatkarAkshay"
    workspaces {
      name = "infra"
    }
  }
  
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "6.28.0"
    }
  }
}