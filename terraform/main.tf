resource "cloudflare_pages_project" "site" {
  account_id        = data.cloudflare_accounts.main.accounts[0].id
  name              = "site"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner             = "bradleyglover"
      repo_name         = "site"
      production_branch = "main"
    }
  }

  build_config {
    build_command   = "hugo -b $CF_PAGES_URL"
    destination_dir = "public"
  }
}

resource "cloudflare_pages_domain" "www" {
  account_id   = data.cloudflare_accounts.main.accounts[0].id
  project_name = cloudflare_pages_project.site.name
  domain       = "www.bradleyglover.com"
}
