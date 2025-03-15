resource "oci_core_route_table" "cloudlab_route_table_tenancy_1" {
  compartment_id = var.oci_tenancy_1
  vcn_id         = var.vcn_1_id
  display_name   = "CloudLab Route Table"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.cloudlab_igw_tenancy_1.id
  }

  route_rules {
    destination       = var.vcn_2_cidr
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_local_peering_gateway.requestor.id
  }

  route_rules {
    destination       = var.vcn_2_ipv6_cidr
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_local_peering_gateway.requestor.id
  }

  provider = oci.tenancy_1
}

resource "oci_core_route_table" "cloudlab_route_table_tenancy_2" {
  compartment_id = var.oci_tenancy_2
  vcn_id         = var.vcn_2_id
  display_name   = "CloudLab Route Table"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.cloudlab_igw_tenancy_2.id
  }

  route_rules {
    destination       = var.vcn_1_cidr
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_local_peering_gateway.acceptor.id
  }

  route_rules {
    destination       = var.vcn_1_ipv6_cidr
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_local_peering_gateway.acceptor.id
  }

  provider = oci.tenancy_2
}

