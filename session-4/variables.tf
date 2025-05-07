variable "instance_type" {
    description = "aws instance size or type"
    type = string // string, number, boolean, list(string), map 
    default = "t2.micro"
}

variable "env" {
   description = "Environmnet"
   type = string
   default = "dev"
}

variable "ingress_ports" {
    description = "a list of ingress ports"
    type = list(number)
    default = [ 22, 80, 443, 3306 ]
}

variable "ingress_cidr" {
    description = "a list of ingress ports"
    type = list(string)
    default = [ "10.0.0.0/16", "0.0.0.0/0", "0.0.0.0/0", "10.0.0.0/16" ]
}