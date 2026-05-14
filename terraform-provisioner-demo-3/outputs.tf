output "public-ip-address" {
  value = aws_instance.ec2-creation.public_ip
}