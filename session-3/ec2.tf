resource "aws_instance" "main" {
  ami           = "ami-07b0c09aab6e66ee9"
  instance_type = var.instance_type
  tags = {
    Name        = "${var.env}-instance" //dev-instance, qa-instance, stage-instance, prod-instance
    Name2       = format("%s-instance", var.env)            // dev-instance
    Environment = var.env
  }
  vpc_security_group_ids = [ aws_security_group.main.id ]
}

// Reference to Resource
// Syntax: first_label.second_label.attribute
// Example: aws_security_group.main.id

// Reference to Input Variable
// Syntax: var.variable_name
// Exampl: var.instance_type

resource "aws_security_group" "main" {
  name        = "webserver-sg"
  description = "Allow SSH access"


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}