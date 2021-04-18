########################### IAM Users & Groups #######################################

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

############################ i3 Metal Workstation Rights #############################

resource "aws_iam_policy" "allow-ostree-master-dir" {
  name = "Allow-Ostree-Master-Dir-RW"
  path = "/"
  description = "A policy to allow Read and Write operation into the Ostree master in the SaaSProj Bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
          "Effect": "Allow",
          "Action": [
            "s3:PutObject",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:DeleteObject",
            "s3:GetBucketLocation"
          ],
          "Resource": [
            "arn:aws:s3:::SaaSProj/ostree/master",
            "arn:aws:s3:::SaaSProj/ostree/master/*"
          ]
        }
    ]
  })

}

resource "aws_iam_policy" "allow-ostree-worker-dir" {
  name = "Allow-Ostree-Worker-Dir-RW"
  path = "/"
  description = "A policy to allow Read and Write operation into the Ostree worker in the SaaSProj Bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
          "Effect": "Allow",
          "Action": [
            "s3:PutObject",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:DeleteObject",
            "s3:GetBucketLocation"
          ],
          "Resource": [
            "arn:aws:s3:::SaaSProj/ostree/worker",
            "arn:aws:s3:::SaaSProj/ostree/worker/*"
          ]
        }
    ]
  })
}


  # TODO : Create the IAM Role for manipulating S3/SaaSproj/ostree
    # TODO : Create the IAM Instance Profile for manipulating S3/SaaSProj/ostree

############################ S3 Bucket Dir. Ostree Policies ############################

# TODO : Create the IAM Policy for the master to read into S3 Folder with { Project : "SaaS" ; Type : "Ostree" ; k8sRole : "master" } (S3/SaasProj/ostree/master)
  # TODO : Create the IAM Role for reading into these folders
    # TODO : Create the IAM Instance Profile for reading these

# TODO : Create the IAM Policy for the worker instances to read into S3 Folder with tags { Project : "SaaS" ; Type : "Ostree" : k8sRole : "master" } (S3/SaaSProj/ostree/worker)
  # TODO : Create the IAM Role for reading into these
    # TODO : Create the IAM Instance Profile for reading into these

############################ S3 Bucket Instances Assets Policies ######################

# TODO : Create the IAM Policy to manipulate the S3 Folders with { Project : "SaaS" ; Type : "instance-assets" } S3/SaaSProj/instances bucket dir
  # TODO : Assign the policy to Administrator_SaaS

# TODO : Create the IAM Policy to create IAM Policies for S3 Folders with { Project : "SaaS" ; Type : "instance-assets" & isPresentKey => instanceName }

############################ SaaS Administrator Rights ################################

# TODO : Code the IAM policy for i3 Metal Instance (PowerOn / PowerOff instance)
  # TODO : Assign the IAM Policy for using the i3 Metal to Administrator_Saas group

# TODO : Create the policy allowing the creation/destruction/manipulation of instances 
  # TODO : Assign to group Administrator_SaaS

# TODO : Create the policy allowing the creation/destruction/manipulation of VPCs
  # TODO : Assign to group Administrator_SaaS

# TODO : Create the policy allowing the creation/destruction/manipulation of Subnets
  # TODO : Assign to group Administrator_SaaS

# TODO : Create the policy allowing the creation/destruction/manipulation of NAT
  # TODO : Assign to group Administrator_SaaS

# TODO : Create the policy allowing the creation/destruction/manipulation of Security Groups
  # TODO : Assign to group Administrator_SaaS

# TODO : Create the policy allowing the creation/destruction/manipulation of Routing Table
  # TODO : Assign to group Administrator_SaaS

# TODO : Create the policy allowing the creation/destruction/manipulation of Internet Gateway
  # TODO : Assign to group Administrator_SaaS

# TODO : Create the policy allowing the manipulation of the S3/TerraformState/SaaS Bucket
  # TODO : Assign to group Administrator_SaaS

# TODO : Create the policy allowing the right to assign instance profiles (worker/master) to instances
  # TODO : Assign to group Administrator_SaaS
