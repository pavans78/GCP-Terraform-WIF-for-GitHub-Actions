terraform {
  backend "gcs" {
    bucket = "gcs-bucket"
    prefix = "tf-state-wif"
  }
}

