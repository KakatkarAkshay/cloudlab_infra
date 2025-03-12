module "instance_kraken" {
  source = "./instance"

  display_name       = "Kraken"
  subnet_id          = module.cloudlab_network_tenancy_1.subnet_id
  oci_compartment    = var.oci_tenancy_1
  tailscale_auth_key = module.tailscale.tailscale_auth_key

  providers = {
    oci = oci.tenancy_1
  }
}

module "instance_vortex" {
  source = "./instance"

  display_name       = "Vortex"
  subnet_id          = module.cloudlab_network_tenancy_1.subnet_id
  oci_compartment    = var.oci_tenancy_1
  tailscale_auth_key = module.tailscale.tailscale_auth_key

  providers = {
    oci = oci.tenancy_1
  }
}

module "instance_leviathan" {
  source = "./instance"

  display_name       = "Leviathan"
  subnet_id          = module.cloudlab_network_tenancy_2.subnet_id
  oci_compartment    = var.oci_tenancy_2
  tailscale_auth_key = module.tailscale.tailscale_auth_key

  providers = {
    oci = oci.tenancy_2
  }
}

module "instance_chimera" {
  source = "./instance"

  display_name       = "Chimera"
  subnet_id          = module.cloudlab_network_tenancy_2.subnet_id
  oci_compartment    = var.oci_tenancy_2
  tailscale_auth_key = module.tailscale.tailscale_auth_key

  providers = {
    oci = oci.tenancy_2
  }
}
