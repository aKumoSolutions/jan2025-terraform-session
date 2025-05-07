resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  tags = {
    Name        = "${var.env}-instance" 
    Name2       = format("%s-instance", var.env)         
    Environment = var.env
  }
  vpc_security_group_ids = [ aws_security_group.main.id ]
  user_data = templatefile("userdata.sh", { environment = var.env })
}

############ Security Group ###########
resource "aws_security_group" "main" {
  name        = "${var.env}-instance-sg"
  description = "Allow SSH and HTTP access"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  count = length( var.ingress_ports )   
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = element( var.ingress_cidr, count.index)
  from_port         = element( var.ingress_ports, count.index )
  ip_protocol       = "tcp"
  to_port           = element( var.ingress_ports, count.index )
}

# Syntax: element(list, index)

# element( [ 45, 67, 23, 14, 57, 15, 17 ], 4 )
# > 

# element( [ 45, 67, 23, 14, 57, 15, 17 ], 3 )
# > 14

# Conditional Hell vs Conditional Expression

# kris = aibek ? value_1 : bus = bus ? value_2 : value_3

# count = 7
# count.index = 0, 1, 2, 3, 4, 5, 6

// 22, 80, 443

// Jyldyz Example: var.private_subnets[count.index] - works


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# With count meta argument, each second_label gets indexed (unique)
# aws_instance.main[0]
# aws_instance.main[1]
# aws_instance.main[2]
# aws_instance.main[3]
# aws_instance.main[4]

# [ 2, 4, 7, 3, 5, 1, 4, 7 ]

# index 4 = 5
# index 2 = 7
# index 7 = 7