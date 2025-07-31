resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "epam-tf-lab-bucket" {
  bucket = "epam-tf-lab-${random_string.random.result}"
}