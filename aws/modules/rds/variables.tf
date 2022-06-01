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

variable "type" {
  description = "Type of instance to use"
  type        = string
}

variable "hdd_size" {
  description = "size of EBS volume"
  type        = number
}

variable "engine" {
  description = "db engine to use"
  type        = string
}

variable "engine_version" {
  description = "Type of instance to use"
  type        = string
}

variable "username" {
  description = "db engine to use"
  type        = string
}

variable "password" {
  description = "Type of instance to use"
  type        = string
}

variable "port" {
  description = "port to connect"
  type        = string
}

variable "default_parameter_group" {
  description = "default parameter group"
  type        = string
}

variable "default_option_group" {
  description = "default major engine version group"
  type        = string
}

variable "db_name" {
  description = "initial DB name"
  type        = string

}

variable "is_termination_protected" {
  description = "prevent delete"
  type        = bool
  default     = true
}


variable "should_publicly_expose_ip" {
  description = "prevent delete"
  type        = bool
  default     = true
}


variable "should_create_option_group" {
  description = "prevent delete"
  type        = bool
  default     = true
}

variable "should_create_parameter_group" {
  description = "prevent delete"
  type        = bool
  default     = true
}


variable "should_create_new_subnet_group" {
  description = "prevent delete"
  type        = bool
  default     = false
}


variable "subnet_group_name" {
  description = "initial DB name"
  type        = string

}

variable "vpc_id" {
  description = "initial DB name"
  type        = string

}