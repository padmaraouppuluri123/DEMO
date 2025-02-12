provider "google" {
  project = "helpful-silo-449805-t4"
  region  = "us-central1"
}

# Generate a random suffix for unique bucket names
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
  numeric = true
}

# Create a new GCS bucket with a unique name every time
resource "google_storage_bucket" "my_bucket" {
  name          = "bucket-${random_string.suffix.result}-padmarao"
  location      = "US"
  storage_class = "STANDARD"
}

# Output the bucket name for reference
output "bucket_name" {
  value = google_storage_bucket.my_bucket.name
}
