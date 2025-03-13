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

locals {
  home_dir    = pathexpand("~")
  kube_dir    = "${local.home_dir}/.kube"
  config_path = "${local.kube_dir}/config"
}

# Create the .kube directory if it doesn't exist
resource "null_resource" "create_kube_dir" {
  provisioner "local-exec" {
    command = "mkdir -p ${local.kube_dir}"
  }
}

resource "local_file" "kubeconfig" {
  content = templatefile("${path.module}/templates/kubeconfig.tftpl", {
    certificate_authority_data = base64encode(module.instance_kraken.certificate_authority_pem)
    kubernetes_server          = "https://${module.instance_kraken.tailscale_ipv4_address}:6443"
    client-certificate-data    = base64encode(module.instance_kraken.client_certificate_pem)
    client-key-data            = base64encode(module.instance_kraken.client_key_pem)
  })
  filename        = local.config_path
  file_permission = "0600"
}
