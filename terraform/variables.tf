variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "vpc_id" {
  description = "default VPC"
  type        = string
  default     = "vpc-0aa58eaabb536e7d3"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# variable "ecs_container_port" {
#     description = "ECS container port"
#     type        = number
#     default     = 3000
# }

variable "ecr_url" {
    description = "ECR URL"
    type        = string
    default     = "255945442255.dkr.ecr.us-east-1.amazonaws.com"
}

variable "ecr_image_name" {
    description = "ECR image name"
    type        = string
    default     = "siewlee-test"
}