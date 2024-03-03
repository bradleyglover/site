data "cloudflare_accounts" "main" {}

data "cloudflare_zone" "main" {
  name = "bradleyglover.com"
}
