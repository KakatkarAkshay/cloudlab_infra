resource "oci_core_local_peering_gateway" "requestor" {
  depends_on     = [oci_identity_policy.requestor_policy]
  compartment_id = var.oci_tenancy_1
  vcn_id         = var.vcn_1_id
  display_name   = "requestor"
  peer_id        = oci_core_local_peering_gateway.acceptor.id

  provider = oci.tenancy_1
}

resource "oci_core_local_peering_gateway" "acceptor" {
  depends_on     = [oci_identity_policy.acceptor_policy]
  compartment_id = var.oci_tenancy_2
  vcn_id         = var.vcn_2_id
  display_name   = "acceptor"

  provider = oci.tenancy_2
}
