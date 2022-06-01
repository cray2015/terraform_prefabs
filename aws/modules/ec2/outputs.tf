output "ec2_complete_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.ec2_instance.instance_state
}

# output "public_ip" {
#   description = "Contains the public IP address"
#   value       = aws_eip.this.public_ip
# }

# output "public_dns" {
#   description = "Public DNS associated with the Elastic IP address"
#   value       = aws_eip.this.public_dns
# }