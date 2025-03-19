resource "oci_containerengine_node_pool" "oke_node_pool" {
  cluster_id         = oci_containerengine_cluster.cluster.id
  compartment_id     = var.oci_compartment
  kubernetes_version = var.kubernetes_version
  name               = var.display_name
  node_shape         = var.node_shape

  node_source_details {
    boot_volume_size_in_gbs = var.boot_volume_size
    image_id                = local.oke_sources[0].image_id
    source_type             = local.oke_sources[0].source_type
  }

  node_config_details {
    dynamic "placement_configs" {
      iterator = pc_iter
      for_each = local.availability_domains
      content {
        availability_domain = pc_iter.value.name
        subnet_id           = oci_core_subnet.node_subnet.id
      }
    }

    size = var.node_count

    node_pool_pod_network_option_details {
      cni_type       = "OCI_VCN_IP_NATIVE"
      pod_subnet_ids = [oci_core_subnet.node_subnet.id]
    }
  }

  node_shape_config {
    ocpus         = var.node_ocpus
    memory_in_gbs = var.node_memory
  }
}
