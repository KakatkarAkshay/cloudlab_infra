resource "oci_core_vcn" "vcn" {
  compartment_id = var.oci_compartment
  display_name   = "VCN 1"
  cidr_block     = var.cidr_block
  is_ipv6enabled = true
}

