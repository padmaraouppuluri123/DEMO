
# Specify the Google Cloud provider
provider "google" {
  credentials = file("C:\Users\hr316\Downloads\helpful-silo-449805-t4-a518f0f8157c.json")  # Path to your GCP credentials JSON file
  project     = "helpful-silo-449805-t4"  # Replace with your actual Google Cloud project ID
  region      = "us-central1"         # Define the region, e.g., us-central1
}

# Example resource: Google Compute Engine VM instance
resource "google_compute_instance" "example-instance" {
  name         = "example-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20210721"  # Replace with your preferred image
    }
  }

  network_interface {
    network = "default"
    access_config {}  # Automatically assigns an external IP
  }
}


