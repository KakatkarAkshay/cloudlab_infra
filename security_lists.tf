resource "oci_core_security_list" "public_security_list" {
    compartment_id = var.oci_compartment
    vcn_id = module.vcn.vcn_id
    display_name = "Security List"

    egress_security_rules {
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all"
      stateless = false
    }

    egress_security_rules {
      destination = "::/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all"
      stateless = false
    }

  # Allow inbound SSH traffic over IPv4
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    description = "Allow SSH from anywhere (IPv4)"
    
    tcp_options {
      min = 22
      max = 22
    }
  }
  
  # Allow inbound SSH traffic over IPv6
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "::/0"
    description = "Allow SSH from anywhere (IPv6)"
    
    tcp_options {
      min = 22
      max = 22
    }
  }

  # Allow inbound HTTP traffic over IPv4
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    description = "Allow HTTP from anywhere (IPv4)"
    
    tcp_options {
      min = 80
      max = 80
    }
  }
  
  # Allow inbound HTTP traffic over IPv6
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "::/0"
    description = "Allow HTTP from anywhere (IPv6)"
    
    tcp_options {
      min = 80
      max = 80
    }
  }

  # Allow inbound HTTPS traffic over IPv4
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    description = "Allow HTTPS from anywhere (IPv4)"  
    
    tcp_options {
      min = 443
      max = 443
    }
  }

  # Allow inbound HTTPS traffic over IPv6
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "::/0"
    description = "Allow HTTPS from anywhere (IPv6)"
    
    tcp_options {
      min = 443
      max = 443
    }
  }

  # Allow inbound ICMP traffic over IPv4
  ingress_security_rules {
    protocol = "1"
    source = "0.0.0.0/0"
    description = "Allow ICMP from anywhere (IPv4)"

    icmp_options {
      type = 3
      code = 4
    }
  }

  # Allow inbound ICMP traffic over IPv6
  ingress_security_rules {
    protocol = "1"
    source = "::/0"
    description = "Allow ICMP from anywhere (IPv6)"

    icmp_options {
      type = 3
      code = 4
    }
  }
}

resource "oci_core_security_list" "private_security_list" {
    compartment_id = var.oci_compartment
    vcn_id = module.vcn.vcn_id
    display_name = "Private Security List"
    
    egress_security_rules {
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all"
      stateless = false
    }

    egress_security_rules {
      destination = "::/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all"
      stateless = false
    }

    ingress_security_rules {
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      protocol = "1"
      stateless = false

      icmp_options {
        type = 3
        code = 4
      }
    }

    ingress_security_rules {
      source = "10.0.0.0/16"
      source_type = "CIDR_BLOCK"
      protocol = "1"
      stateless = false

      icmp_options {
        type = 3
      }
    }
}