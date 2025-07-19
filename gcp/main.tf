resource "google_storage_bucket" "bucket1" {
  name     = "bucket-tf-demo"
  location = "EU"

#   lifecycle_rule {
#     action {
#       type = "Delete"
#     }
#     condition {
#       age = 30
#     }
#   }
}
