resource "oci_core_security_list" "service_security_list" {
  compartment_id = var.oci_compartment
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "Service Security List"
}

resource "oci_core_security_list" "endpoint_security_list" {
  compartment_id = var.oci_compartment
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "Endpoint Security List"

  egress_security_rules {
    destination      = data.oci_core_services.services.services[1].cidr_block
    destination_type = "SERVICE_CIDR_BLOCK"
    protocol         = "6"
    stateless        = false
    description      = "Allow Kubernetes Control Plane to communicate with OKE"

    tcp_options {
      min = 443
      max = 443
    }
  }

  egress_security_rules {
    destination      = oci_core_vcn.vcn.cidr_block
    destination_type = "CIDR_BLOCK"
    protocol         = "All"
    stateless        = false
    description      = "All traffic to worker nodes"
  }

  egress_security_rules {
    destination      = oci_core_vcn.vcn.ipv6cidr_blocks[0]
    destination_type = "CIDR_BLOCK"
    protocol         = "All"
    stateless        = false
    description      = "All traffic to worker nodes"
  }

  ingress_security_rules {
    source      = "0.0.0.0/0"
    protocol    = "6"
    stateless   = false
    description = "Access to Kubernetes API endpoint (IPv4)"

    tcp_options {
      min = 6443
      max = 6443
    }
  }

  ingress_security_rules {
    source      = "::/0"
    protocol    = "6"
    stateless   = false
    description = "External access to Kubernetes API endpoint (IPv6)"

    tcp_options {
      min = 6443
      max = 6443
    }
  }

  ingress_security_rules {
    source      = oci_core_vcn.vcn.cidr_block
    protocol    = "6"
    stateless   = false
    description = "Kubernetes worker to control plane communication (IPv4)"

    tcp_options {
      min = 12250
      max = 12250
    }
  }

  ingress_security_rules {
    source      = oci_core_vcn.vcn.ipv6cidr_blocks[0]
    protocol    = "6"
    stateless   = false
    description = "Kubernetes worker to control plane communication (IPv6)"

    tcp_options {
      min = 12250
      max = 12250
    }
  }

  ingress_security_rules {
    source      = oci_core_vcn.vcn.cidr_block
    protocol    = "1"
    stateless   = false
    description = "Path discovery"
  }

  ingress_security_rules {
    source      = oci_core_vcn.vcn.ipv6cidr_blocks[0]
    protocol    = "1"
    stateless   = false
    description = "Path discovery"
  }
}

resource "oci_core_security_list" "node_security_list" {
  compartment_id = var.oci_compartment
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "Node Security List"

  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "All"
    stateless        = false
    description      = "Allow all traffic to the internet"
  }

  egress_security_rules {
    destination      = "::/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "All"
    stateless        = false
    description      = "Allow all traffic to the internet"
  }

  egress_security_rules {
    destination      = local.all_bom_services_in_oci_network.cidr_block
    destination_type = "SERVICE_CIDR_BLOCK"
    protocol         = "6"
    stateless        = false
    description      = "Allow nodes to communicate with OKE"

    tcp_options {
      min = 443
      max = 443
    }
  }

  ingress_security_rules {
    source      = oci_core_vcn.vcn.cidr_block
    protocol    = "All"
    stateless   = false
    description = "Allow communication with OKE"
  }

  ingress_security_rules {
    source      = oci_core_vcn.vcn.ipv6cidr_blocks[0]
    protocol    = "All"
    stateless   = false
    description = "Allow communication with OKE"
  }
}
