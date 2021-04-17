########################### IAM Users & Groups #######################################

# TODO : Create the group Administrator_SaaS 
  # TODO : Create the User sfaisal_SaaS
    # TODO : Add sfaisal_Saas to Administrator_SaaS

############################ i3 Metal Workstation Rights #############################

# TODO : Create the IAM Policy for i3 Metal Instance to use the S3/SaaSproj/ostree/*
  # TODO : Create the IAM Role for manipulating S3/SaaSproj/ostree
    # TODO : Create the IAM Instance Profile for manipulating S3/SaaSProj/ostree

############################ S3 Bucket Dir. Ostree Policies ############################

# TODO : Create the IAM Policy for the master instance to read into S3/SaasProj/ostree/master
  # TODO : Create the IAM Role for reading into ostree/master
    # TODO : Create the IAM Instance Profile for reading into ostree/master

# TODO : Create the IAM Policy for the worker instances to read into S3/SaaSProj/ostree/worker
  # TODO : Create the IAM Role for reading into ostree/worker
    # TODO : Create the IAM Instance Profile for reading into ostree/worker

############################ S3 Bucket Instances Assets Policies ######################

# TODO : Create the IAM Policy to manipulate the S3/SaaSProj/instances bucket dir
  # TODO : Assign the policy to Administrator_SaaS

# TODO : Create the IAM Policy to read the S3/SaaSProj/instances/master bucket dir
  # TODO : Create the IAM Role
    # TODO : Create the IAM instance profile

# TODO : Create the IAM Policy to read the S3/SaaSProj/instances/worker1 bucket dir
  # TODO : Create the IAM Role
    # TODO : Create the IAM instance profile


# TODO : Create the IAM Policy to read the S3/SaaSProj/instances/worker2 bucket dir
  # TODO : Create the IAM Role
    # TODO : Create the IAM instance profile

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
