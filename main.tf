provider "google" {
  project     = "helpful-silo-449805"
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name          = "demo-bucket1"
  location      = "US"
}
