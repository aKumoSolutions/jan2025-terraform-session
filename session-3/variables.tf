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