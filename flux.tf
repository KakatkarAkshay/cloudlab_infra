resource "flux_bootstrap_git" "flux_repo" {
  depends_on = [github_repository.flux_repo]

  embedded_manifests = true
  path               = "clusters/triton-cluster"
}
