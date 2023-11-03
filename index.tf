provider "google" {
  credentials = file("service-account-key.json")
  project     = "high-territory-403908" 
  region      = "us-central1"      
}

# backend in GCS.
terraform {
  backend "gcs" {
    bucket  = "my-terraform-bucket-27"  #name
    prefix  = "terraform-bucket-27"           
  }
}

resource "google_compute_instance" "homework" {
  name         = "homework"
  machine_type = "e2-small"  
  zone         = "us-central1-a"  
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts" # ОС Ubuntu 22.04
      size  = 10
    }
  }
  network_interface {
    network = "default"
    subnetwork = "default"
  }
  tags = ["with-bucket", "homework"]
}

