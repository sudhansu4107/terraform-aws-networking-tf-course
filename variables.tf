variable "vpc_config" {
  description="Contains the vpc configuration. More specifially , the required cidr_block and vpc name."
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

  description=<<EOT
  Accepts a map of subnet configuration , Each Subnet configuration should contain 
  public  : whether the subnet should be public or not.
  az      : The availibility zone where to deploy the subnet. 
  EOT

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

