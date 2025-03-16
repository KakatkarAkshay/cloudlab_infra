resource "kubectl_manifest" "traefik_namespace" {
  yaml_body = file("${path.module}/manifests/traefik/namespace.yaml")
}

resource "helm_release" "traefik" {
  name       = "traefik"
  repository = "https://helm.traefik.io/traefik"
  chart      = "traefik"
  namespace  = "traefik"
  atomic     = true

  values = [templatefile("${path.module}/values/traefik.tftpl", {
    cloudflare_api_token = var.cloudflare_api_token
    certresolver_email   = var.certresolver_email
    domain               = var.domain
  })]

  depends_on = [kubectl_manifest.traefik_volume]
}

resource "kubectl_manifest" "traefik_volume" {
  yaml_body = file("${path.module}/manifests/traefik/volume.yaml")

  depends_on = [time_sleep.wait_for_longhorn, kubectl_manifest.traefik_namespace]
}

resource "time_sleep" "wait_for_traefik" {
  depends_on = [helm_release.traefik]

  create_duration = "30s"
}

resource "kubectl_manifest" "traefik_middleware" {
  yaml_body = file("${path.module}/manifests/traefik/middleware.yaml")

  depends_on = [time_sleep.wait_for_traefik]
}
