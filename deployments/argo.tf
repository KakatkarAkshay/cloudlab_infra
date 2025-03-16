
resource "kubectl_manifest" "argo_namespace" {
  yaml_body = file("${path.module}/manifests/argo/namespace.yaml")
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"

  values = [
    templatefile("${path.module}/values/argo.tftpl", {
      domain                  = var.domain
      authentik_client_id     = var.argocd_authentik_client_id
      authentik_client_secret = var.argocd_authentik_client_secret
    })
  ]

  depends_on = [kubectl_manifest.argo_namespace]
}

resource "kubectl_manifest" "argo_ingress" {
  yaml_body = templatefile("${path.module}/manifests/argo/ingress.tftpl", {
    domain = var.domain
  })

  depends_on = [helm_release.argocd, time_sleep.wait_for_traefik]
}
