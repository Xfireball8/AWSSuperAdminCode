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

resource "aws_iam_policy" "allow-ostree-master-dir-fullcontrol" {
  name = "Allow-Ostree-Master-Dir-FullControl"
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
          ],
          "Resource": [
            "arn:aws:s3:::saasproj/ostree/master",
            "arn:aws:s3:::saasproj/ostree/master/*"
          ]
        }
    ]
  })

}

resource "aws_iam_policy" "allow-ostree-worker-dir-fullcontrol" {
  name = "Allow-Ostree-Worker-Dir-FullControl"
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
          ],
          "Resource": [
            "arn:aws:s3:::saasproj/ostree/worker",
            "arn:aws:s3:::saasproj/ostree/worker/*"
          ]
        }
    ]
  })
}


  # TODO : Create the IAM Role for manipulating S3/SaaSproj/ostree
    # TODO : Create the IAM Instance Profile for manipulating S3/SaaSProj/ostree

############################ S3 Bucket Dir. Ostree Policies ############################

  # TODO : Create the IAM Role for reading into these folders
    # TODO : Create the IAM Instance Profile for reading these

resource "aws_iam_policy" "allow-ostree-master-dir-read" {
  name = "Allow-Ostree-Master-Dir-Read"
  path = "/"
  description = "A policy to allow Read and Write operation into the Ostree worker in the SaaSProj Bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
          "Effect": "Allow",
          "Action": [
            "s3:GetObject",
            "s3:ListBucket",
          ],
          "Resource": [
            "arn:aws:s3:::SaaSProj/ostree/master",
            "arn:aws:s3:::SaaSProj/ostree/master/*"
          ]
        }
    ]
  })
}

resource "aws_iam_policy" "allow-ostree-worker-dir-read" {
  name = "Allow-Ostree-Worker-Dir-Read"
  path = "/"
  description = "A policy to allow Read and Write operation into the Ostree worker in the SaaSProj Bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
          "Effect": "Allow",
          "Action": [
            "s3:GetObject",
            "s3:ListBucket",
          ],
          "Resource": [
            "arn:aws:s3:::SaaSProj/ostree/worker",
            "arn:aws:s3:::SaaSProj/ostree/worker/*"
          ]
        }
    ]
  })
}


  # TODO : Create the IAM Role for reading into these
    # TODO : Create the IAM Instance Profile for reading into these

############################ S3 Bucket Instances Assets Policies ######################

# TODO : Create the IAM Policy to manipulate the S3 Folders with { Project : "SaaS" ; Type : "instance-assets" } S3/SaaSProj/instances bucket dir
  # TODO : Assign the policy to Administrator_SaaS


resource "aws_iam_policy" "allow-ostree-instances-dir-fullcontrol" {
  name = "Allow-Ostree-Worker-Dir-Read"
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
            "s3:DeleteObject"
          ],
          "Resource": [
            "arn:aws:s3:::SaaSProj/instances",
            "arn:aws:s3:::SaaSProj/instances/*"
          ]
        }
    ]
  })
}


# TODO : Create the IAM Policy to create IAM Policies for S3 Folders with { Project : "SaaS" ; Type : "instance-assets" & isPresentKey => instanceName }


resource "aws_iam_policy" "saas-admin-iam-rights" {
  name = "saas-admin-iam-rights"
  path = "/"
  description = "A policy to allow Read and Write operation into the Ostree worker in the SaaSProj Bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
          "Sid" : "IAMTaskAllowed"
          "Effect": "Allow",
          "Action": [
            "iam:CreatePolicy",
            "iam:CreateRole",
            "iam:AddRoleToInstanceProfile",
            "iam:RemoveRoleFromInstanceProfile",
            "iam:AttachRolePolicy",
            "iam:CreateInstanceProfile",
            "iam:DeleteInstanceProfile",
            "iam:DeletePolicy",
            "iam:DeleteRole",
            "iam:DetachRolePolicy",
            "iam:GetInstanceProfile",
            "iam:GetPolicy",
            "iam:GetRole",
            "iam:TagInstanceProfile",
            "iam:TagPolicy",
            "iam:TagRole",
            "iam:UntagInstanceProfile",
            "iam:UntagPolicy",
            "iam:UntagRole",
            "iam:UpdateRole",
            "iam:UpdateRoleDescription",
            "iam:UpdateAssumeRolePolicy",
            "iam:PassRole"
          ],
          "Resource": [
          ]
        },
        {
          "Sid" : "DenyPermBoundaryIAMPolicyAlteration",
          "Effect": "Deny",
          "Action": [
            "iam:DeletePolicy",
            "iam:DeletePolicyVersion",
            "iam:CreatePolicyVersion",
            "iam:SetDefaultPolicyVersion"
          ],
          "Resource": [
            "arn:aws:iam::#TODO : AccountID:policy/saas-admin-iam-rights"
          ]
        },
        {
          "Sid" : "DenyRemovalOfPermBoundaryFromAnyUserOrRole",
          "Effect" : "Deny",
          "Action" : [
              "iam:DeleteUserPermissionsBoundary",
              "iam:DeleteRolePermissionsBoundary"
          ],
          "Resource": [
              "arn:aws:iam::#TODO : AccountID:user/*",
              "arn:aws:iam::#TODO : AccountID:role/*",
          ],
          "Condition": {
              "StringEquals" : {
                "iam:PermissionsBoundary": "arn:aws:iam::#TODO : AcccountID:policy/saas-admin-iam-rights"
              }
          }
        },
        {
          "Sid" : "DenyUserAndRoleCreationWithOutPermBoundary",
          "Effect": "Deny",
          "Action": [
            "iam:CreateUser",
            "iam:CreateRole",
          ],
          "Resource": [
            "arn:aws:iam::#TODO : AccountID:user/*",
            "arn:aws:iam::#TODO : AccountID:role/*"
          ],
          "Condition": {
            "StringNotEquals": "arn:aws:iam::#TODO : AccountID:policy/saas-admin-iam-rights"
          }
        }
    ]
  })
}

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
