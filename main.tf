provider "google" {
  project     = "helpful-silo-449805-t4"
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name          = "Bucket888padmarao"
  location      = "US"
}
