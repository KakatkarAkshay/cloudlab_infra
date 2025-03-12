data "oci_core_images" "ubuntu_24_04_minimal_aarch64" {
  compartment_id           = var.oci_tenancy_1
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "24.04 Minimal aarch64"
  shape                    = var.oci_instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"

  provider = oci.tenancy_1
}

locals {
  ubuntu_24_04_minimal_aarch64_image_id = data.oci_core_images.ubuntu_24_04_minimal_aarch64.images[0].id
}
