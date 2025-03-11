resource "oci_core_route_table" "cloudlab_route_table" {
  compartment_id = var.oci_compartment
  vcn_id         = oci_core_vcn.cloudlab_vcn.id
  display_name   = "CloudLab Route Table"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.cloudlab_igw.id
  }
}

