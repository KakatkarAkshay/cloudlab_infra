resource "github_repository" "flux_repo" {
  name       = var.github_repo_name
  visibility = "public"
  auto_init  = true
}

resource "tls_private_key" "flux" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "github_repository_deploy_key" "this" {
  title      = "Flux"
  repository = github_repository.flux_repo.name
  key        = tls_private_key.flux.public_key_openssh
  read_only  = "false"
}
