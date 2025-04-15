resource "cloudflare_dns_record" "kraken" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_kraken.public_ip
  name    = "*"
  proxied = true
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "chimera" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_chimera.public_ip
  name    = "*"
  proxied = true
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "leviathan" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_leviathan.public_ip
  name    = "*"
  proxied = true
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "vortex" {
  zone_id = var.cloudflare_zone_id
  content = module.instance_vortex.public_ip
  name    = "*"
  proxied = true
  ttl     = 1
  type    = "A"
}

