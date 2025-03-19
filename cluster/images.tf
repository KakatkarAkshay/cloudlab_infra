data "oci_containerengine_node_pool_option" "oke_node_pool_option" {
  node_pool_option_id = "all"
}

locals {
  oke_sources = [
    for source in data.oci_containerengine_node_pool_option.oke_node_pool_option.sources :
    source if strcontains(source.source_name, "OKE-${replace(var.kubernetes_version, "/[^0-9.]/", "")}") &&
    strcontains(source.source_name, "Oracle-Linux-${var.linux_version}") &&
    (strcontains(source.source_name, "aarch64") == can(regex("^VM\\.Standard\\.A", var.node_shape)))
  ]
}
