data "oci_core_services" "services" {}

locals {
  all_bom_services_in_oci_network = data.oci_core_services.services.services[1]
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.oci_compartment
  display_name   = "IGW"
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_nat_gateway" "ngw" {
  compartment_id = var.oci_compartment
  display_name   = "NGW"
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_service_gateway" "sgw" {
  compartment_id = var.oci_compartment
  display_name   = "SGW"
  vcn_id         = oci_core_vcn.vcn.id

  services {
    service_id = local.all_bom_services_in_oci_network.id
  }
}
