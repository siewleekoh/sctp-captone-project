terraform {
  backend "s3" {
    bucket = "sctp-ce5-tfstate-bucket-1"
    key    = "ce5-group2-capstone.tfstate"
    region = "us-east-1"
  }
}