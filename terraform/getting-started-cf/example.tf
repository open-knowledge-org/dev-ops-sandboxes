terraform {
  required_providers {
    cloudfoundry = {
      source = "cloudfoundry-community/cloudfoundry"
      version = "0.12.6"
    }
  }
}

provider "cloudfoundry" {
  api_url             = "https://api.local.pcfdev.io"
  user                = "admin"
  password            = "admin"
  skip_ssl_validation = true
}