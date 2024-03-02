# Site

Runs my personal site, https://www.bradleyglover.com.

For a more thorough walkthrough of the tools and how this was setup, please visit my site and see the blog posts.

### Hugo

[Hugo](https://gohugo.io/) is the underlying framework that generate the content for the site, and use the [PaperMod theme](https://github.com/adityatelange/hugo-PaperMod).

### Cloudflare

[Cloudflare Pages](https://pages.cloudflare.com/) builds and hosts the site.

### Terraform

Terraform is used to manage the Cloudflare resources.

State is configured in [Terraform Cloud](https://developer.hashicorp.com/terraform/cloud-docs).