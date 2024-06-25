terraform {
  backend "s3" {
    bucket = "sctp-tfstate-bucket"
    key    = "ce5-group2-capstone-project.tfstate"
    region = "ap-southeast-1"
  }
}