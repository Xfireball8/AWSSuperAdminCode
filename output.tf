# TODO : Create output variables for instance variable ssh login

output "workstation_ip" {
  description = "Public IP of the workstation, Connect through ssh with user : ubuntu" 
  value = aws_instance.i3metal_workstation.public_ip 
}

