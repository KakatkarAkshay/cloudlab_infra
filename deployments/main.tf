terraform {
  required_providers {
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
