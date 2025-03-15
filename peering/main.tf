terraform {
  required_providers {
    oci = {
      source                = "oracle/oci"
      version               = "6.28.0"
      configuration_aliases = [oci.tenancy_1, oci.tenancy_2]
    }
  }
}
