module "cloudlab_network_tenancy_1" {
  source = "./network"

  oci_compartment = var.oci_tenancy_1

  providers = {
    oci = oci.tenancy_1
  }
}

module "cloudlab_network_tenancy_2" {
  source = "./network"

  oci_compartment = var.oci_tenancy_2

  providers = {
    oci = oci.tenancy_2
  }
}
