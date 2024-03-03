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
    build_command   = "hugo"
    destination_dir = "public"
  }
}

resource "cloudflare_pages_domain" "www" {
  account_id   = data.cloudflare_accounts.main.accounts[0].id
  project_name = cloudflare_pages_project.site.name
  domain       = "www.bradleyglover.com"
}

resource "cloudflare_ruleset" "root_to_www_redirect" {
  zone_id = data.cloudflare_zone.main.id
  name    = "root to www redirect"
  kind    = "zone"
  phase   = "http_request_dynamic_redirect"

  rules {
    action      = "redirect"
    description = "root to www redirect"
    action_parameters {
      from_value {
        status_code = 301
        target_url {
          expression = "concat(\"https://www.bradleyglover.com\", http.request.uri.path)"
        }
        preserve_query_string = true
      }
    }
    expression = "(http.host eq \"bradleyglover.com\")"
    enabled    = true
  }
}
