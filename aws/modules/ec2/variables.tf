variable "type" {
  description = "Type of instance to use"
  type        = string
}


variable "region" {
  description = "Region of instance"
  type        = string
}


variable "keyname" {
  description = "Pem key for SSH"
  type        = string
}

variable "tags" {
  description = "Tag identifiers"
  type = object({
    Name        = string
    description = string
    created_by  = string
    env         = string
    region      = string
    Terraform   = bool
  })
}

variable "hdd_size" {
  description = "size of EBS volume"
  type        = number
}


variable "security_group_ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from        = number
    to          = number
    cidr_range  = list(string)
    protocol    = string
    description = string
  }))
}
variable "cpu_credits" {
  description = "T type instance credit limit"
  type        = string
  default     = "standard"
}


variable "is_ebs_optimized" {
  description = "T type instance credit limit"
  type        = bool
  default     = false
}

variable "is_termination_protected" {
  description = "enable/disable termination protection"
  type        = bool
  default     = false
}

variable "iam_role" {
  description = "iam role to access aws services"
  type        = string
  default     = ""
}

variable "is_arm_instance" {
  description = "is using arm graviton processors"
  type        = bool
  default     = false
}

variable "need_eip"{
 description = "requires Elastic IP?"
  type        = bool
  default     = false   
}


