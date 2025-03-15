module "instance_kraken" {
  source = "./master"

  display_name       = "Kraken"
  subnet_id          = module.cloudlab_peering.subnet_1_id
  oci_compartment    = var.oci_tenancy_1
  tailscale_auth_key = tailscale_tailnet_key.tailscale_auth_key.key
  advertise_routes   = [module.cloudlab_network_tenancy_1.cidr_block, module.cloudlab_network_tenancy_2.cidr_block, module.cloudlab_network_tenancy_1.ipv6_cidr_blocks[0], module.cloudlab_network_tenancy_2.ipv6_cidr_blocks[0]]

  providers = {
    oci = oci.tenancy_1
  }
}

module "instance_vortex" {
  source = "./worker"

  display_name    = "Vortex"
  subnet_id       = module.cloudlab_peering.subnet_1_id
  oci_compartment = var.oci_tenancy_1
  ssh_private_key = module.instance_kraken.ssh_private_key
  ssh_public_key  = module.instance_kraken.ssh_public_key
  bootstrap_token = module.instance_kraken.bootstrap_token
  ca_cert_hash    = module.instance_kraken.ca_cert_hash
  master_ip       = module.instance_kraken.private_ip

  providers = {
    oci = oci.tenancy_1
  }

  depends_on = [module.instance_kraken]
}

module "instance_leviathan" {
  source = "./worker"

  display_name    = "Leviathan"
  subnet_id       = module.cloudlab_peering.subnet_2_id
  oci_compartment = var.oci_tenancy_2
  ssh_private_key = module.instance_kraken.ssh_private_key
  ssh_public_key  = module.instance_kraken.ssh_public_key
  bootstrap_token = module.instance_kraken.bootstrap_token
  ca_cert_hash    = module.instance_kraken.ca_cert_hash
  master_ip       = module.instance_kraken.private_ip

  providers = {
    oci = oci.tenancy_2
  }

  depends_on = [module.instance_kraken]
}

module "instance_chimera" {
  source = "./worker"

  display_name    = "Chimera"
  subnet_id       = module.cloudlab_peering.subnet_2_id
  oci_compartment = var.oci_tenancy_2
  ssh_private_key = module.instance_kraken.ssh_private_key
  ssh_public_key  = module.instance_kraken.ssh_public_key
  bootstrap_token = module.instance_kraken.bootstrap_token
  ca_cert_hash    = module.instance_kraken.ca_cert_hash
  master_ip       = module.instance_kraken.private_ip

  providers = {
    oci = oci.tenancy_2
  }

  depends_on = [module.instance_kraken]
}
