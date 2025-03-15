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
  cidr_block      = "10.1.0.0/16"

  providers = {
    oci = oci.tenancy_2
  }
}

module "cloudlab_peering" {
  source = "./peering"

  oci_tenancy_1       = var.oci_tenancy_1
  oci_tenancy_2       = var.oci_tenancy_2
  oci_requestor_group = var.oci_requestor_group
  vcn_1_id            = module.cloudlab_network_tenancy_1.vcn_id
  vcn_1_cidr          = module.cloudlab_network_tenancy_1.cidr_block
  vcn_1_ipv6_cidr     = module.cloudlab_network_tenancy_1.ipv6_cidr_blocks[0]
  vcn_2_id            = module.cloudlab_network_tenancy_2.vcn_id
  vcn_2_cidr          = module.cloudlab_network_tenancy_2.cidr_block
  vcn_2_ipv6_cidr     = module.cloudlab_network_tenancy_2.ipv6_cidr_blocks[0]

  providers = {
    oci           = oci
    oci.tenancy_1 = oci.tenancy_1
    oci.tenancy_2 = oci.tenancy_2
  }
}
