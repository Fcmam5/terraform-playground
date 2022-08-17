terraform {
  required_version = ">= 1.1.0"
  required_providers {
    fakewebservices = {
      source  = "hashicorp/fakewebservices"
      version = "0.2.3"
    }
  }
  cloud {
    organization = "playground-dev"
    workspaces {
      name = "fake-webservices"
    }
  }
}
