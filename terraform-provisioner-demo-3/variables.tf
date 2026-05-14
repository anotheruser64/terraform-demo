variable "cidr_vpc" {
  default = "10.0.0.0/16"
}
variable "cidr_subnet" {
  default = "10.0.1.0/24"
}
variable "ami-id" {
  default = "ami-091138d0f0d41ff90"
}
variable "instance-type" {
  default = "t2.micro"
}