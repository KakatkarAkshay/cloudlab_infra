variable "cloudflare_api_token" {
  type        = string
  description = "The Cloudflare API token with DNS Edit permissions"
}

variable "controller_ipv4_address" {
  type        = string
  description = "The IPv4 address of the controller"
}

variable "domain" {
  type        = string
  description = "The domain name of the cluster"
  default     = "kakatkarakshay.dev"
}

variable "certresolver_email" {
  type        = string
  description = "The email address for the certresolver"
}
