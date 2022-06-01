# https://www.hashicorp.com/events/webinars/using-a-monorepo-with-terraform-cloud
# https://prefetch.net/blog/2020/04/29/using-terraform-for_each-statements-and-dynamic-nested-blocks-to-simply-aws-security-group-ingress-statements/
# https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d
# https://www.codurance.com/publications/2020/04/28/terraform-with-multiple-environments

provider "aws" {
  region = "us-east-1"
}
module "test_ec2" {
  source = "../../modules/ec2"

  type                         = "t4g.small"
  region                       = "us-east-1"
  keyname                      = "<!--aws_access_key_name-->"
  tags                         = { "Name" : "test_ec2", "description" : "test_ec2 instance creation with TF", "created_by" : "TF", "env" : "dev", "region" : "us-east-1", "Terraform" : "true" }
  hdd_size                     = 30
  security_group_ingress_rules = [{ "from" = 22, "to" = 22, "cidr_range" = ["0.0.0.0/0"], "protocol" = "tcp", "description" = "ssh" }, { "from" = 80, "to" = 80, "cidr_range" = ["0.0.0.0/0"], "protocol" = "tcp", "description" = "http" }, { "from" = 443, "to" = 443, "cidr_range" = ["0.0.0.0/0"], "protocol" = "tcp", "description" = "https" }]
  cpu_credits                  = "unlimited"
  is_termination_protected     = true
  # iam_role                     = "<!--your_iam_instance_profile_name-->"
  is_arm_instance              = true
  need_eip                     = true

}
