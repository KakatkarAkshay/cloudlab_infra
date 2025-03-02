module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.6.0"

  # Required Inputs
  compartment_id = var.oci_compartment

  # Optional Inputs 
  region = var.oci_region
  
  # Changing the following default values
  vcn_name = "vcn"
  create_internet_gateway = true
  create_nat_gateway = true
  create_service_gateway = true
  internet_gateway_display_name = "igw"
  nat_gateway_display_name = "ngw"
  enable_ipv6 = true
  service_gateway_display_name = "sgw"
  vcn_cidrs = ["10.0.0.0/16"]
}