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
    ssh = {
      source  = "toowoxx/ssh"
      version = "1.0.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.0-pre2"
    }
    kubectl = {
      source  = "bnu0/kubectl"
      version = "0.27.0"
    }
  }
}
