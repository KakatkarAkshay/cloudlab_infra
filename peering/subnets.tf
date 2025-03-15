resource "oci_core_subnet" "cloudlab_subnet_tenancy_1" {
  cidr_block                 = cidrsubnet(var.vcn_1_cidr, 8, 0)
  vcn_id                     = var.vcn_1_id
  compartment_id             = var.oci_tenancy_1
  display_name               = "CloudLab Subnet"
  ipv6cidr_block             = cidrsubnet(var.vcn_1_ipv6_cidr, 8, 0)
  security_list_ids          = [oci_core_security_list.cloudlab_security_list_tenancy_1.id]
  route_table_id             = oci_core_route_table.cloudlab_route_table_tenancy_1.id
  prohibit_public_ip_on_vnic = false

  provider = oci.tenancy_1
}

resource "oci_core_subnet" "cloudlab_subnet_tenancy_2" {
  cidr_block                 = cidrsubnet(var.vcn_2_cidr, 8, 1)
  vcn_id                     = var.vcn_2_id
  compartment_id             = var.oci_tenancy_2
  display_name               = "CloudLab Subnet"
  ipv6cidr_block             = cidrsubnet(var.vcn_2_ipv6_cidr, 8, 1)
  security_list_ids          = [oci_core_security_list.cloudlab_security_list_tenancy_2.id]
  route_table_id             = oci_core_route_table.cloudlab_route_table_tenancy_2.id
  prohibit_public_ip_on_vnic = false

  provider = oci.tenancy_2
}
