variable "vpc_config" {
  type = object({
    cidr_block = string
    name       = string
  })
  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "input value provide for the vpc_config cidr option is invalid, please provide a valid CIDR BLOCK ex: 0.0.0.0/16"
  }
}

variable "subnet_config" {
  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  }))
  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "input value provide for the subnet_config cidr option is invalid, please provide a valid CIDR BLOCK ex: 0.0.0.0/16"
  }
}

