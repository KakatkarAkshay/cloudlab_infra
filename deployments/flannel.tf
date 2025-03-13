resource "helm_release" "flannel" {
  name             = "flannel"
  repository       = "https://flannel-io.github.io/flannel"
  chart            = "flannel"
  namespace        = "kube-flannel"
  create_namespace = true

  set = [
    {
      name  = "podCidr"
      value = "10.244.0.0/16"
    }
  ]
}

resource "time_sleep" "wait_for_flannel" {
  depends_on = [helm_release.flannel]

  create_duration = "2m"
}
