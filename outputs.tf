output "cloud9_public_ip" {
  value = aws_eip.cloud9_eip.public_ip
}