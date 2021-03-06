resource "aws_iam_group" "administrator-saas" {
  name = "administrator_saas"
  path = "/users/"
}

resource "aws_iam_user" "sfaisal-saas" {
  name = "sfaisal_saas"
  path = "/users/"

  tags = {
    ownership = "super-administrator"
    project = "saas"
  }
}

resource "aws_iam_user_login_profile" "sfaisal-saas_login_profile" {
  user  = aws_iam_user.sfaisal-saas.name
  pgp_key = "keybase:orangemushroom1"
}

resource "aws_iam_access_key" "sfaisal-saas_access_key" {
  user = aws_iam_user.sfaisal-saas.name
  pgp_key = "keybase:orangemushroom1"
}

resource "aws_iam_group_membership" "administrator-saas-membership" {
  name = "administrator-saas-membership"
  group = aws_iam_group.administrator-saas.name
  users = [
    aws_iam_user.sfaisal-saas.name
  ]
}

resource "aws_iam_group_policy" "admin_saas_boundaries" {
  name = "Admin-SaaS-Boundaries"
  group = aws_iam_group.administrator-saas.name
  policy = file("iam_policy/admin-saas-boundaries.json")
}

resource "aws_iam_policy" "instance_saas_boundaries" {
  name = "Instance-SaaS-Boundaries"
  path = "/"
  description = "The boundaries for the instances created by adminstrator_saas group"
  policy = file("iam_policy/instance-saas-boundaries.json")

  tags = {
    ownership = "super-administrator"
  }
}
