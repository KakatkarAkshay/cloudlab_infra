resource "oci_core_instance" "instance" {
  availability_domain = local.availability_domain
  compartment_id      = var.oci_compartment
  display_name        = var.display_name
  shape               = var.oci_instance_shape

  shape_config {
    ocpus         = var.oci_instance_opus
    memory_in_gbs = var.oci_instance_memory_in_gb
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    display_name     = "${var.display_name} VNIC"
    assign_public_ip = true
    assign_ipv6ip    = true
  }

  source_details {
    boot_volume_size_in_gbs = var.oci_boot_volume_size_in_gb
    boot_volume_vpus_per_gb = var.oci_boot_volume_vpus_per_gb
    source_type             = "image"
    source_id               = local.ubuntu_image_id
  }

  metadata = {
    ssh_authorized_keys = local.ssh_keys
    user_data = base64encode(templatefile("${path.module}/cloudinit/master.tftpl", {
      hostname            = lower(var.display_name),
      tailscale_auth_key  = var.tailscale_auth_key,
      ca_cert_pem         = base64encode(tls_self_signed_cert.k8s_ca_cert.cert_pem)
      ca_key_pem          = base64encode(tls_private_key.k8s_ca_key.private_key_pem)
      apiserver_key_pem   = base64encode(tls_private_key.k8s_apiserver_key.private_key_pem)
      client_key_pem      = base64encode(tls_private_key.k8s_client_key.private_key_pem)
      ssh_host_key_pem    = base64encode(tls_private_key.ssh_host_key.private_key_pem)
      ssh_host_pubkey_pem = tls_private_key.ssh_host_key.public_key_openssh
      bootstrap_token     = local.bootstrap_token
      certificate_key     = local.certificate_key
    }))
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = tls_private_key.ssh_host_key.private_key_pem
  }

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait > /dev/null"
    ]
  }
}

resource "time_sleep" "wait_for_reboot" {
  depends_on      = [oci_core_instance.instance]
  create_duration = "3m"
}

resource "ssh_resource" "worker_join_command" {
  host        = oci_core_instance.instance.public_ip
  user        = "ubuntu"
  private_key = tls_private_key.ssh_host_key.private_key_pem
  commands    = ["kubeadm token create --print-join-command"]

  depends_on = [time_sleep.wait_for_reboot]
}

resource "ssh_resource" "tailscale_ipv4_address" {
  host        = oci_core_instance.instance.public_ip
  user        = "ubuntu"
  private_key = tls_private_key.ssh_host_key.private_key_pem
  commands    = ["tailscale ip -4"]

  depends_on = [time_sleep.wait_for_reboot]
}

output "worker_join_command" {
  value = ssh_resource.worker_join_command.result
}

output "tailscale_ipv4_address" {
  value = trimspace(chomp(ssh_resource.tailscale_ipv4_address.result))
}
