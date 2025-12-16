output "us_private_ip" {
  value = aws_instance.us_east_server.private_ip
}

output "aps2_private_ip" {
  value = aws_instance.aps2_server.private_ip
}

