output "ip_address" {
  value = aws_instance.web.public_ip
}
output "dns_name" {
  value = aws_instance.web.public_dns
}

output "ip_address_west" {
  value = aws_instance.web_west.public_ip
}
output "dns_name_west" {
  value = aws_instance.web_west.public_ip
}