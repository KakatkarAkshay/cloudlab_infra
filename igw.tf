resource "oci_core_internet_gateway" "cloudlab_igw" {
  compartment_id = var.oci_compartment
  vcn_id         = oci_core_vcn.cloudlab_vcn.id
  display_name   = "CloudLab Internet Gateway"
}
