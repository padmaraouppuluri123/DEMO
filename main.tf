provider "google" {
  project     = "helpful-silo-449805-t4"
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name          = "bucket8889-padmarao"
  location      = "US"
}
