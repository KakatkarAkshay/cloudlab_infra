resource "oci_core_internet_gateway" "cloudlab_igw_tenancy_1" {
  compartment_id = var.oci_tenancy_1
  vcn_id         = var.vcn_1_id
  display_name   = "CloudLab Internet Gateway"

  provider = oci.tenancy_1
}

resource "oci_core_internet_gateway" "cloudlab_igw_tenancy_2" {
  compartment_id = var.oci_tenancy_2
  vcn_id         = var.vcn_2_id
  display_name   = "CloudLab Internet Gateway"

  provider = oci.tenancy_2
}
