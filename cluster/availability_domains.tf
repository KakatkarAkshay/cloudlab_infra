data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.oci_compartment
}

locals {
  availability_domains = data.oci_identity_availability_domains.ADs.availability_domains
}
