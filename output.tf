# TODO : Create output variables for instance variable ssh login
output "password" {
  value = aws_iam_user_login_profile.sfaisal-saas_login_profile.encrypted_password
}

output "access_key" {
  value = aws_iam_access_key.sfaisal-saas_access_key.id
}

output "secret_key" {
  value = aws_iam_access_key.sfaisal-saas_access_key.encrypted_secret
}
