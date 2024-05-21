variable "vpc_private_subnets" {
  description = "vpc private subnets"
  type        = set(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


variable "vpc_public_subnets" {
  description = "vpc public subnets"
  type        = set(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
