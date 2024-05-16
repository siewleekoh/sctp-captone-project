variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "aws_account_id" {
  type      = string
  sensitive = true
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "ce5-group2-eks-terraform"
}

variable "user1_name" {
  type        = string
  default = "lfchin23"
}

variable "user2_name" {
  type        = string
  default = "jonathan"
}