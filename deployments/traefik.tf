resource "helm_release" "traefik" {
  name             = "traefik"
  repository       = "https://helm.traefik.io/traefik"
  chart            = "traefik"
  namespace        = "traefik"
  create_namespace = true
  atomic           = true

  values = [templatefile("${path.module}/values/traefik.tftpl", {
    cloudflare_api_token = var.cloudflare_api_token
  })]

  depends_on = [time_sleep.wait_for_flannel]
}

resource "time_sleep" "wait_for_traefik" {
  depends_on = [helm_release.traefik]

  create_duration = "30s"
}
