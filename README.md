Work In Progress !!!

== What is this ? ==

This is a big project about the PoC of an infrastructure related to cloud-native applications. 
It is a prelude of other projects, it has been made to demonstrate what i can achieve to learn 
by myself and to illustrate my skills in my resume. 
It's a prelude and prototype of other cool projects that have yet to come :) !

It is temporary public because i'm searching for an internship/job and i'm candidating to MsCs for 
the next year.

--------------------------------------------------------------------------------------------------

IaC that the AWS SuperAdmin will produce in our fictional enterprise.

Our fictional enterpise has created a team to build SaaS applications.

The idea here is that the Super Admin will allow some necessary resource for our SaaS creators team and delegate
the development of the infrastructure to the DevOps member of the Team. 

To do so it will create some buckets, one that is for terraform state files and some others related to OS Creation process (For example : kubeconfigs file of instances) ; and will manage RBAC with amazon IAM.

The DevOps is responsible for :
- Creating the cloud infrastructure for the cluster (Repo of this code here : https://github.com/Xfireball8/SaasProjectCluster)
- Creating an custom OS based on Fedora Core Os for the cluster (Repo of the code here: https://github.com/Xfireball8/KubernetesOS-Config)

--------------------------------------------------------------------------------------------------

As 03/05, the rights are really not okay and buckets infrastructure will likely change. 
I'm testing some things related to OS Creation and AWS and i need to 
get data on what operations i do to bring a finer access control on my DevOps. 
An example of a finer access control can be found in early commits ; but this repo will change dramatically later. 
