# terraform-aws-networking-tf-course
Networking module created during Lauro Muller terraform course.


This module manages the creation of VPCs and subnets, allwoing for the creation of 
both private and public subnets.

Example usages:
```
module "vpc" {
  source = "./module/networking"
  vpc_config = {
    cidr_block = "your_vpc_cidr"
    name       = "13-local-modules"
  }
  subnet_config = {
    subnet_1 = {
      cidr_block = "your_subnet_cidr"
      public     = true
      az         = "us-east-1a"
    }
    subnet_2 = {
      cidr_block = "your_subnet_cidr"
      az         = "us-east-1a"
    }

}
```