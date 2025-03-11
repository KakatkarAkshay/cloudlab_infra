module "cloudlab_network_tenancy_1" {
  source = "./network"

  oci_compartment = var.tenancy_1_oci_compartment

  providers = {
    oci = oci.tenancy_1
  }
}
