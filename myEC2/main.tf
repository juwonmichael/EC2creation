
provider "aws" {
  region = "eu-west-2"
  
}
resource "aws_instance" "mycopy_ec2" {
  ami           = "ami-08f78cb3cc8a4578e"
  instance_type = "t2.micro"
  key_name      = "mylowkey"
  
  tags = {
    Name = "MyEC2Instance66"
  }
}

resource "aws_eip" "mynewlb" {
  instance = aws_instance.mycopy_ec2.id
  
  
}
output "EIP" {
  value = aws_eip.mynewlb.public_ip
  
}

variable "ingressrules" {    
    description = "Ingress rules for the security group"
    type = list(number)
    default = [80, 443]
}

variable "egressrules" {    
    description = "Egress rules for the security group"
    type = list(number)
    default = [443, 80, 22] 
}

resource "aws_security_group" "mywebtraffic" {
  name        = "web_traffic"
  description = "Allow web traffic"



dynamic "ingress" {
  iterator = port
  # This is the variable that will be used to iterate over
    for_each = var.ingressrules
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
    dynamic "egress" {
      iterator = port
      # This is the variable that will be used to iterate over
        for_each = var.egressrules
        content {
          from_port   = egress.value
          to_port     = egress.value
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        } 
    }
  }