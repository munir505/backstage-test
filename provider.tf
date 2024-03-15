provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

terraform {
  required_version = "1.7.1"
  required_providers {
    google = {
      version = "5.19.0"
    }
    google-beta = {
      version = "5.19.0"
    }
  }

  backend "gcs" {
    bucket = "backstage-vm-natasha"
    prefix = "coen-natasha-abdul"
  }
}