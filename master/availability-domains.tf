data "oci_identity_availability_domains" "availability_domains" {
  compartment_id = var.oci_compartment
}

locals {
  availability_domain = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name
}
