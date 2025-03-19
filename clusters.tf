module "triton_cluster" {
  source = "./cluster"

  oci_compartment = var.oci_tenancy
  display_name    = "Triton Cluster"
}
