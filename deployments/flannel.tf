resource "helm_release" "flannel" {
  name             = "flannel"
  repository       = "https://flannel-io.github.io/flannel"
  chart            = "flannel"
  namespace        = "kube-flannel"
  create_namespace = true
  atomic           = true

  values = [file("${path.module}/values/flannel.yaml")]
}

resource "time_sleep" "wait_for_flannel" {
  depends_on = [helm_release.flannel]

  create_duration = "2m"
}
