resource "tailscale_tailnet_key" "tailscale_auth_key" {
  description   = "Tailscale auth key"
  reusable      = true
  ephemeral     = true
  preauthorized = true
  tags          = ["tag:kubernetes-node"]
}
