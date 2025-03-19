resource "oci_core_subnet" "service_subnet" {
  compartment_id    = var.oci_compartment
  vcn_id            = oci_core_vcn.vcn.id
  cidr_block        = cidrsubnet(oci_core_vcn.vcn.cidr_block, 8, 0)
  ipv6cidr_block    = cidrsubnet(oci_core_vcn.vcn.ipv6cidr_blocks[0], 8, 0)
  display_name      = "Services Subnet"
  route_table_id    = oci_core_route_table.public_rt.id
  security_list_ids = [oci_core_security_list.service_security_list.id]
}

resource "oci_core_subnet" "endpoint_subnet" {
  compartment_id    = var.oci_compartment
  vcn_id            = oci_core_vcn.vcn.id
  cidr_block        = cidrsubnet(oci_core_vcn.vcn.cidr_block, 8, 1)
  ipv6cidr_block    = cidrsubnet(oci_core_vcn.vcn.ipv6cidr_blocks[0], 8, 1)
  display_name      = "Endpoint Subnet"
  route_table_id    = oci_core_route_table.public_rt.id
  security_list_ids = [oci_core_security_list.endpoint_security_list.id]
}

resource "oci_core_subnet" "node_subnet" {
  compartment_id             = var.oci_compartment
  vcn_id                     = oci_core_vcn.vcn.id
  cidr_block                 = cidrsubnet(oci_core_vcn.vcn.cidr_block, 8, 2)
  ipv6cidr_block             = cidrsubnet(oci_core_vcn.vcn.ipv6cidr_blocks[0], 8, 2)
  display_name               = "Node Subnet"
  route_table_id             = oci_core_route_table.private_rt.id
  security_list_ids          = [oci_core_security_list.node_security_list.id]
  prohibit_public_ip_on_vnic = true
}
