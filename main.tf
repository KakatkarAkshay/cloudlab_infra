terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.28.0"
    }
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.5.1"
    }
    github = {
      source  = "integrations/github"
      version = ">= 6.6.0"
    }
  }
}
