resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"
  tags = {
    Name        = "session-9-instance"
    Environment = var.env
    Engineer = "1"
    Engineer = "2"
    
  }
}
variable "env" {
    type = string
    description = "environment"
    default = "qa"
}




// Fetch Amazon Linux 2023 AMI ID
data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.7.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_sqs_queue" "main" {
    name = "session-9-sqs"
}

# 1. Change the second label, main to main1
# 2. Comment the code block, terraform apply, uncomment the code block, terraform apply