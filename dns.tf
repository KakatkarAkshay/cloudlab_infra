resource "cloudflare_dns_record" "chimera_dns_record" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_chimera.public_ip
  name    = "@"
  proxied = false
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "chimera_wildcard_dns_record" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_chimera.public_ip
  name    = "*"
  proxied = false
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "leviathan_dns_record" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_leviathan.public_ip
  name    = "@"
  proxied = false
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "leviathan_wildcard_dns_record" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_leviathan.public_ip
  name    = "*"
  proxied = false
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "vortex_dns_record" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_vortex.public_ip
  name    = "@"
  proxied = false
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "vortex_wildcard_dns_record" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_vortex.public_ip
  name    = "*"
  proxied = false
  ttl     = 1
  type    = "A"
}

