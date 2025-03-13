module "instance_kraken" {
  source = "./master"

  display_name       = "Kraken"
  subnet_id          = module.cloudlab_network_tenancy_1.subnet_id
  oci_compartment    = var.oci_tenancy_1
  tailscale_auth_key = tailscale_tailnet_key.tailscale_auth_key.key
  tailnet_dns_name   = var.tailnet_dns_name

  providers = {
    oci = oci.tenancy_1
  }
}

module "instance_vortex" {
  source = "./worker"

  display_name       = "Vortex"
  subnet_id          = module.cloudlab_network_tenancy_1.subnet_id
  oci_compartment    = var.oci_tenancy_1
  tailscale_auth_key = tailscale_tailnet_key.tailscale_auth_key.key
  ssh_private_key    = module.instance_kraken.ssh_private_key
  ssh_public_key     = module.instance_kraken.ssh_public_key
  bootstrap_token    = module.instance_kraken.bootstrap_token
  ca_cert_hash       = module.instance_kraken.ca_cert_hash
  master_ip          = module.instance_kraken.tailscale_ipv4_address

  providers = {
    oci = oci.tenancy_1
  }

  depends_on = [module.instance_kraken]
}

module "instance_leviathan" {
  source = "./worker"

  display_name       = "Leviathan"
  subnet_id          = module.cloudlab_network_tenancy_2.subnet_id
  oci_compartment    = var.oci_tenancy_2
  tailscale_auth_key = tailscale_tailnet_key.tailscale_auth_key.key
  ssh_private_key    = module.instance_kraken.ssh_private_key
  ssh_public_key     = module.instance_kraken.ssh_public_key
  bootstrap_token    = module.instance_kraken.bootstrap_token
  ca_cert_hash       = module.instance_kraken.ca_cert_hash
  master_ip          = module.instance_kraken.tailscale_ipv4_address

  providers = {
    oci = oci.tenancy_2
  }

  depends_on = [module.instance_kraken]
}

module "instance_chimera" {
  source = "./worker"

  display_name       = "Chimera"
  subnet_id          = module.cloudlab_network_tenancy_2.subnet_id
  oci_compartment    = var.oci_tenancy_2
  tailscale_auth_key = tailscale_tailnet_key.tailscale_auth_key.key
  ssh_private_key    = module.instance_kraken.ssh_private_key
  ssh_public_key     = module.instance_kraken.ssh_public_key
  bootstrap_token    = module.instance_kraken.bootstrap_token
  ca_cert_hash       = module.instance_kraken.ca_cert_hash
  master_ip          = module.instance_kraken.tailscale_ipv4_address

  providers = {
    oci = oci.tenancy_2
  }

  depends_on = [module.instance_kraken]
}
