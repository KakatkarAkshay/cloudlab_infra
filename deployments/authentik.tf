resource "random_password" "authentik_secret_key" {
  length = 50
}

resource "random_password" "authentik_postgres_password" {
  length = 50
}

resource "kubectl_manifest" "authentik_namespace" {
  yaml_body = file("${path.module}/manifests/authentik/namespace.yaml")
}

resource "helm_release" "authentik" {
  name             = "authentik"
  repository       = "https://charts.goauthentik.io"
  chart            = "authentik"
  namespace        = "authentik"
  create_namespace = true

  values = [
    templatefile("${path.module}/values/authentik.tftpl", {
      domain                      = var.domain
      authentik_secret_key        = random_password.authentik_secret_key.result
      authentik_postgres_password = random_password.authentik_postgres_password.result
    })
  ]

  depends_on = [time_sleep.wait_for_traefik, kubectl_manifest.authentik_namespace]
}

resource "kubectl_manifest" "authentik_ingress" {
  yaml_body = templatefile("${path.module}/manifests/authentik/ingress.tftpl", {
    domain = var.domain
  })

  depends_on = [helm_release.authentik]
}

resource "time_sleep" "wait_for_authentik" {
  depends_on      = [helm_release.authentik]
  create_duration = "10s"
}
