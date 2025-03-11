resource "oci_core_subnet" "cloudlab_subnet" {
  cidr_block                 = cidrsubnet(oci_core_vcn.cloudlab_vcn.cidr_block, 8, 0)
  vcn_id                     = oci_core_vcn.cloudlab_vcn.id
  compartment_id             = var.oci_compartment
  display_name               = "Public Subnet"
  ipv6cidr_block             = cidrsubnet(oci_core_vcn.cloudlab_vcn.ipv6cidr_blocks[0], 8, 0)
  security_list_ids          = [oci_core_security_list.cloudlab_security_list.id]
  route_table_id             = oci_core_route_table.cloudlab_route_table.id
  prohibit_public_ip_on_vnic = false
}
