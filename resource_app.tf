# resource "google_project" "my_project" {
#   name       = "Terraform-Project"
#   project_id = "gcp-terraform-demo-dwp7kp"
# }

# resource "google_app_engine_application" "app" {
#   project     = google_project.my_project.project_id
#   location_id = "us-central"
# }