resource "oci_containerengine_cluster" "cluster" {
  compartment_id     = var.oci_compartment
  kubernetes_version = var.kubernetes_version
  name               = var.display_name
  vcn_id             = oci_core_vcn.vcn.id
  type               = var.cluster_type

  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = oci_core_subnet.endpoint_subnet.id
  }

  cluster_pod_network_options {
    cni_type = "OCI_VCN_IP_NATIVE"
  }

  options {
    add_ons {
      is_kubernetes_dashboard_enabled = true
      is_tiller_enabled               = true
    }
    service_lb_subnet_ids = [oci_core_subnet.service_subnet.id]
  }
}

data "oci_containerengine_cluster_kube_config" "cluster_kubeconfig" {
  cluster_id = oci_containerengine_cluster.cluster.id
}

locals {
  cluster_kubeconfig = yamldecode(data.oci_containerengine_cluster_kube_config.cluster_kubeconfig.content)
}

output "cluster_id" {
  value = oci_containerengine_cluster.cluster.id
}

output "certificate_authority_data" {
  value = local.cluster_kubeconfig.clusters[0].cluster.certificate-authority-data
}

output "cluster_endpoint" {
  value = local.cluster_kubeconfig.clusters[0].cluster.server
}
