############################## VPC Stuff #########################################

resource "aws_vpc" "workstation_vpc" {
  cidr_block = "192.168.0.0/28"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  assign_generated_ipv6_cidr_block = "false"
}

resource "aws_subnet" "workstation_subnet" {
  vpc_id = aws_vpc.workstation_vpc.id
  cidr_block = "192.168.0.0/28"
}

resource "aws_default_security_group" "workstation_sg" {
  vpc_id = aws_vpc.workstation_vpc.id
  
  ingress {
    description = "Access to the workstation by SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_default_route_table" "workstation_route_table" {
  default_route_table_id = aws_vpc.workstation_vpc.default_route_table_id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.workstation_igw.id
  }
}

resource "aws_route_table_association" "workstation_subnet_association" {
  subnet_id = aws_subnet.workstation_subnet.id
  route_table_id = aws_vpc.workstation_vpc.default_route_table_id
}

resource "aws_internet_gateway" "workstation_igw" {
  vpc_id = aws_vpc.workstation_vpc.id
}

############################# Instance Stuff #####################################

# TODO : Create i3 Metal instance

resource "aws_instance" "i3metal_workstation" {
  ami = "ami-0d6aecf0f0425f42a"
  instance_type = "i3.metal"
  associate_public_ip_address = "true"
  instance_initiated_shutdown_behavior = "terminate"
  subnet_id = aws_subnet.workstation_subnet.id
  private_ip = "192.168.0.14"
  key_name = "Faisal" 

  root_block_device {
    delete_on_termination = "true"
    volume_size = 40
    volume_type = "gp2"
  }
}

