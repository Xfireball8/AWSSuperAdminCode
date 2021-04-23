# TODO : Create output variables for instance variable ssh login

output "workstation_ip" {
  description = "Public IP of the workstation, Connect through ssh with user : ubuntu" 
  value = aws_instance.i3metal_workstation.public_ip 
}

output "password" {
  value = aws_iam_user_login_profile.sfaisal-saas_login_profile.encrypted_password
}

output "access_key" {
  value = aws_iam_access_key.sfaisal-saas_access_key.id
}

output "secret_key" {
  value = aws_iam_access_key.sfaisal-saas_access_key.encrypted_secret
}
