terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.28.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 2.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.18.0"
    }
  }
}
