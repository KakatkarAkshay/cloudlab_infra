locals {
  home_path = pathexpand("~")
}

resource "local_file" "kubeconfig" {
  directory_permission = "0700"
  file_permission      = "0600"
  content              = data.oci_containerengine_cluster_kube_config.cluster_kubeconfig.content
  filename             = "${local.home_path}/.kube/${lower(element(split(" ", var.display_name), 0))}-config"
}
