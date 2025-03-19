module "triton_cluster" {
  source = "./cluster"

  oci_compartment = var.oci_tenancy
  display_name    = "Triton Cluster"
}

module "scorpion_cluster" {
  source = "./cluster"

  oci_compartment = var.oci_tenancy_2
  display_name    = "Scorpion Cluster"
  cidr_block      = "10.1.0.0/16"

  providers = {
    oci = oci.tenancy_2
  }
}
