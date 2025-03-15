resource "helm_release" "longhorn" {
  name             = "longhorn"
  repository       = "https://charts.longhorn.io"
  chart            = "longhorn"
  namespace        = "longhorn-system"
  create_namespace = true
  atomic           = true

  depends_on = [time_sleep.wait_for_flannel]
}

resource "time_sleep" "wait_for_longhorn" {
  depends_on = [helm_release.longhorn]

  create_duration = "3m"
}

resource "kubectl_manifest" "longhorn_ingress" {
  yaml_body = templatefile("${path.module}/manifests/longhorn-ingress.tftpl", {
    domain = var.domain
  })

  depends_on = [time_sleep.wait_for_traefik]
}
