provider "oci" {
  user_ocid    = var.oci_user
  fingerprint  = var.oci_fingerprint
  private_key  = var.oci_private_key
  tenancy_ocid = var.oci_tenancy
  region       = var.oci_region
}

provider "flux" {
  kubernetes = {
    host                   = module.triton_cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(module.triton_cluster.certificate_authority_data)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "oci"
      args = [
        "ce",
        "cluster",
        "generate-token",
        "--cluster-id",
        module.triton_cluster.cluster_id,
        "--region",
        var.oci_region
      ]
    }
  }
  git = {
    url = "ssh://git@github.com/${var.github_username}/${var.github_repo_name}.git"
    ssh = {
      username    = "git"
      private_key = tls_private_key.flux.private_key_pem
    }
  }
}

provider "github" {
  owner = var.github_username
  token = var.github_token
}
