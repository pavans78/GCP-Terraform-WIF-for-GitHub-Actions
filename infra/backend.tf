terraform {
  backend "gcs" {
    bucket = "gcs-bucket-078"
    prefix = "tf-state-wif"
  }
}

