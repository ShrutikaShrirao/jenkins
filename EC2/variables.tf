#vpc 
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name for the VPC"
  default     = "TechM_A7_asset_VPC"
}


variable "subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  default     = "us-west-2b"
}

variable "subnet_name" {
  description = "Name for the public subnet"
  default     = "TechM-A7-asset-Public Subnet"
}


variable "igw_name" {
  description = "Name for the internet gateway"
  default     = "TechM-A7-asset-Internet-Gateway"
}

variable "route_table_name" {
  description = "Name for the route table"
  default     = "TechM-A7-asset-Route-Table"
}


variable "vpc_flow_logs_name" {
  description = "Name for the VPC flow logs"
  default     = "TechM-A7-asset-Test_logs"
}

variable "log_destination" {
  description = "log destination for vpc flow logs"
  default     = "s3"
}

variable "traffic_type" {
  description = "log destination traffic type for vpc flow logs"
  default     = "ALL"
}

variable "max_aggregation_interval" {
  description = "log destination  interval time for vpc flow logs"
  default     = 60
}

#EC2 instance
variable "instance_ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0449c34f967dbf18a"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}


variable "instance_name" {
  description = "Name for the EC2 instance"
  default     = "TechM-A7-asset-EC2"
}


# security Group
variable "security_group_name_prefix" {
  description = "Prefix for the security group name"
  default     = "instance-sg-"
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks for SSH ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "http_cidr_blocks" {
  description = "CIDR blocks for HTTP ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "https_cidr_blocks" {
  description = "CIDR blocks for HTTP ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_http_cidr_blocks" {
  description = "CIDR blocks for HTTP egress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "security_group_name" {
  description = "Name for the security group"
  default     = "TechM-A7-asset-securitygroup"
}



