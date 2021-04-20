resource "aws_iam_group" "administrator-saas" {
  name = "administrator_saas"
  path = "/users/"
}

resource "aws_iam_user" "sfaisal-saas" {
  name = "sfaisal_saas"
  path = "/users/"
}

resource "aws_iam_group_membership" "administrator-saas-membership" {
  name = "administrator-saas-membership"
  group = aws_iam_group.administrator-saas.name
  users = [
    aws_iam_user.sfaisal-saas.name
  ]
}

resource "aws_iam_policy" "allow-ostree-master-dir-fullcontrol" {
  name = "Allow-Ostree-Master-Dir-FullControl"
  path = "/"
  description = "A policy to allow Read and Write operation into the Ostree master in the SaaSProj Bucket"

  policy = jsonencode(file("iam_policy/rw-ostree-master.json"))
}

resource "aws_iam_policy" "allow-ostree-worker-dir-fullcontrol" {
  name = "Allow-Ostree-Worker-Dir-FullControl"
  path = "/"
  description = "A policy to allow Read and Write operation into the Ostree worker in the SaaSProj Bucket"

  policy = jsonencode(file("iam_policy/rw-ostree-worker.json"))
}

resource "aws_iam_group_policy" "allow-poweron-shutdown-i3metal" {
  name = "Allow-Poweron-Shutdown-i3metal"
  group = aws_iam_group.administrator-saas.name
  path = "/"
  description = "A policy to allow PowerOn/Reboot/Shutdown on i3 Workstations"

  policy = jsonencode(file("iam_policy/poweron-shutdown-i3metal.json"))
}


resource "aws_iam_group_policy" "admin_saas_boundaries" {
  name = "Admin-SaaS-Boundaries"
  group = aws_iam_group.administrator-saas.name
  path = "/"
  description = "The boundaries for the admnistrator_saas group"
  policy = jsonencode(file("iam_policy/admin-saas-boundaries.json"))
}

resource "aws_iam_policy" "instance_saas_boundaries" {
  name = "Instance-SaaS-Boundaries"
  path = "/"
  description = "The boundaries for the instances created by adminstrator_saas group"
  policy = jsonencode(file("iam_policy/instance-saas-boundaries.json"))
}
