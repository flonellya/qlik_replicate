terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-gov-west-1"
}

resource "aws_instance" "qlik_replicate" {
  ami           = "ami-008a7a42f9c885956"
  instance_type = "t3.medium"
  subnet_id =  "subnet-0c10df3f9e5866889"
  key_name = "qlik_west"
  security_groups = ["sg-0a4b195f1bc2000a2"]

  tags = {
    Name = "Attunity-replicate"
    Auto-StartStop-Enabled = "true"
    Environment = "Test"
    Poc = "florence.vinyo@manteh.com"
  }
}
output "instance_ip_addr" {
  value = aws_instance.qlik_replicate.private_ip
}

