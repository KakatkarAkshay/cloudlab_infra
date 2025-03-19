resource "oci_core_route_table" "private_rt" {
  compartment_id = var.oci_compartment
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "Private RT"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.ngw.id
    description       = "Route to the internet"
  }

  route_rules {
    destination       = local.all_bom_services_in_oci_network.cidr_block
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.sgw.id
    description       = "Route to the internet"
  }
}

resource "oci_core_route_table" "public_rt" {
  compartment_id = var.oci_compartment
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "Public RT"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
    description       = "Route to the internet"
  }

  route_rules {
    destination       = "::/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
    description       = "Route to the internet (IPv6)"
  }
}
