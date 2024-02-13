output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.A7_vpc_flowlogs.id
}

output "subnet_id" {
  description = "ID of the created public subnet"
  value       = aws_subnet.A7-vpc-public_subnet.id
}

output "igw_id" {
  description = "ID of the created internet gateway"
  value       = aws_internet_gateway.A7-vpc-flowlogs-igw.id
}

output "route_table_id" {
  description = "ID of the created route table"
  value       = aws_route_table.A7-vpc-flowlogs-rt.id
}

output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.A7-vpc-ec2.id
}

output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.A7-vpc-instance_security_group.id
}

output "public_dns" {
  value = aws_instance.A7-vpc-ec2.public_dns
}

output "public_ip" {
  value = aws_instance.A7-vpc-ec2.public_ip
}