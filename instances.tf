module "instance_kraken" {
  source = "./instance"

  display_name       = "Kraken"
  subnet_id          = module.cloudlab_network_tenancy_1.subnet_id
  oci_compartment    = var.tenancy_1_oci_compartment
  oci_image_id       = local.ubuntu_24_04_minimal_aarch64_image_id
  tailscale_auth_key = module.tailscale.tailscale_auth_key

  providers = {
    oci = oci.tenancy_1
  }
}

module "instance_vortex" {
  source = "./instance"

  display_name       = "Vortex"
  subnet_id          = module.cloudlab_network_tenancy_1.subnet_id
  oci_compartment    = var.tenancy_1_oci_compartment
  oci_image_id       = local.ubuntu_24_04_minimal_aarch64_image_id
  tailscale_auth_key = module.tailscale.tailscale_auth_key

  providers = {
    oci = oci.tenancy_1
  }
}
