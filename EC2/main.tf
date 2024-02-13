
# Create a VPC with DNS support and hostnames enabled
resource "aws_vpc" "A7_vpc_flowlogs" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}


# Create a public subnet
resource "aws_subnet" "A7-vpc-public_subnet" {
  vpc_id            = aws_vpc.A7_vpc_flowlogs.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = var.subnet_name
  }
  map_public_ip_on_launch = true
}

# Create an internet gateway
resource "aws_internet_gateway" "A7-vpc-flowlogs-igw" {
  vpc_id = aws_vpc.A7_vpc_flowlogs.id

  tags = {
    Name = var.igw_name
  }
}

# Create a route table
resource "aws_route_table" "A7-vpc-flowlogs-rt" {
  vpc_id = aws_vpc.A7_vpc_flowlogs.id

  tags = {
    Name = var.route_table_name
  }
}

# Associate public subnet with the route table
resource "aws_route_table_association" "A7-vpc-public_association" {
  subnet_id      = aws_subnet.A7-vpc-public_subnet.id
  route_table_id = aws_route_table.A7-vpc-flowlogs-rt.id
}

# Add a route to the internet gateway in the route table
resource "aws_route" "internet_gateway_route" {
  route_table_id         = aws_route_table.A7-vpc-flowlogs-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.A7-vpc-flowlogs-igw.id
}

# Create an AWS security group
resource "aws_security_group" "A7-vpc-instance_security_group" {
  name_prefix = var.security_group_name_prefix
  vpc_id      = aws_vpc.A7_vpc_flowlogs.id

  # Ingress rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_cidr_blocks
  }
    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.https_cidr_blocks  # Define your HTTPS CIDR blocks
  }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_cidr_blocks
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.egress_http_cidr_blocks
  }

  tags = {
    Name = var.security_group_name
  }
}


# Create an AWS EC2 instance

resource "aws_instance" "A7-vpc-ec2" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.A7-vpc-public_subnet.id

   # Attach the security group to the EC2 instance
  vpc_security_group_ids = [aws_security_group.A7-vpc-instance_security_group.id]

  tags = {
    Name = var.instance_name
  }
  user_data = file("${path.module}/userdata.sh")
}

