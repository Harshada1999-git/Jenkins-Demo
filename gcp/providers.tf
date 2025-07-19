terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.43.0"
    }
  }
}

provider "google" {
  project     = "practice-demo-465113"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "key.json"
}