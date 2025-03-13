module "instance_kraken" {
  source = "./master"

  display_name       = "Kraken"
  subnet_id          = module.cloudlab_network_tenancy_1.subnet_id
  oci_compartment    = var.oci_tenancy_1
  tailscale_auth_key = module.tailscale.tailscale_auth_key

  providers = {
    oci = oci.tenancy_1
  }
}

module "instance_vortex" {
  source = "./worker"

  display_name        = "Vortex"
  subnet_id           = module.cloudlab_network_tenancy_1.subnet_id
  oci_compartment     = var.oci_tenancy_1
  tailscale_auth_key  = module.tailscale.tailscale_auth_key
  ssh_private_key     = module.instance_kraken.ssh_private_key
  ssh_public_key      = module.instance_kraken.ssh_public_key
  worker_join_command = module.instance_kraken.worker_join_command

  providers = {
    oci = oci.tenancy_1
  }

  depends_on = [module.instance_kraken]
}

module "instance_leviathan" {
  source = "./worker"

  display_name        = "Leviathan"
  subnet_id           = module.cloudlab_network_tenancy_2.subnet_id
  oci_compartment     = var.oci_tenancy_2
  tailscale_auth_key  = module.tailscale.tailscale_auth_key
  ssh_private_key     = module.instance_kraken.ssh_private_key
  ssh_public_key      = module.instance_kraken.ssh_public_key
  worker_join_command = module.instance_kraken.worker_join_command

  providers = {
    oci = oci.tenancy_2
  }

  depends_on = [module.instance_kraken]
}

module "instance_chimera" {
  source = "./worker"

  display_name        = "Chimera"
  subnet_id           = module.cloudlab_network_tenancy_2.subnet_id
  oci_compartment     = var.oci_tenancy_2
  tailscale_auth_key  = module.tailscale.tailscale_auth_key
  ssh_private_key     = module.instance_kraken.ssh_private_key
  ssh_public_key      = module.instance_kraken.ssh_public_key
  worker_join_command = module.instance_kraken.worker_join_command

  providers = {
    oci = oci.tenancy_2
  }

  depends_on = [module.instance_kraken]
}
