

locals {
  ouput_pub_subnets = {
    for key in keys(local.public_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
  ouput_pvt_subnets = {
    for key in keys(local.private_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
}

output "vpc_id" {
  description = "AWS ID from the created vpc"
  value       = aws_vpc.this.id
}

output "output_public_subnets" {
  description = "The ID and the availability zone of public subents"
  value       = local.ouput_pub_subnets
}

output "output_private_subnets" {
  description = "The ID and the availability zone of private subents"
  value       = local.ouput_pvt_subnets
}


output "vpc_default_sg"{
  value=data.aws_security_group.default.id
}