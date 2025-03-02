resource "oci_core_subnet" "public_subnet" {
  cidr_block = "10.0.0.0/24"
  vcn_id = module.vcn.vcn_id
  compartment_id = var.oci_compartment
  display_name = "Public Subnet"
  ipv6cidr_blocks = []
  security_list_ids = [oci_core_security_list.public_security_list.id]
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "private_subnet" {
  compartment_id = var.oci_compartment
  vcn_id = module.vcn.vcn_id
  display_name = "Private Subnet"
  cidr_block = "10.0.1.0/24"
  ipv6cidr_blocks = []
  security_list_ids = [oci_core_security_list.private_security_list.id]
  prohibit_public_ip_on_vnic = true
}
