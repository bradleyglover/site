terraform {
  required_version = "~> 1.7.0"
  
  cloud {
    organization = "bradley-glover"
    workspaces {
      name = "main"
    }  
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {}
