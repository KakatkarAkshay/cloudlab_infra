output "vcn_id" {
  value = oci_core_vcn.cloudlab_vcn.id
}

output "cidr_block" {
  value = oci_core_vcn.cloudlab_vcn.cidr_block
}

output "ipv6_cidr_blocks" {
  value = oci_core_vcn.cloudlab_vcn.ipv6cidr_blocks
}
