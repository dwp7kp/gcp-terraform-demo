terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("~/Downloads/testingthis-331316-e31991c2927f.json")

  project = "testingthis-331316"
  region  = "us-central1"
  zone    = "us-central1-c"
}