terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "acquired-storm-428614-i2"
  region  = "us-central1"
}

