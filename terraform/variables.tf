variable "key_name" {
  description = "Name of your EC2 key pair (AWS Console > EC2 > Key Pairs). Used for SSH."
  type        = string
}

variable "instance_profile" {
  description = "Name of an existing IAM instance profile to attach, so the machine gets temporary AWS credentials. Leave null for none."
  type        = string
  default     = null
}
