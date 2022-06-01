# https://www.hashicorp.com/events/webinars/using-a-monorepo-with-terraform-cloud
# https://prefetch.net/blog/2020/04/29/using-terraform-for_each-statements-and-dynamic-nested-blocks-to-simply-aws-security-group-ingress-statements/
# https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d
# https://www.codurance.com/publications/2020/04/28/terraform-with-multiple-environments

provider "aws" {
  region = "us-east-1"
}
module "test_mysql" {
  source = "../../modules/rds"

  type                          = "db.t4g.small"
  tags                          = { "Name" : "test_db", "description" : "MySQL for housekeeping", "created_by" : "TF", "env" : "dev", "region" : "us-east-1", "Terraform" : "true" }
  hdd_size                      = 20
  is_termination_protected      = true
  should_publicly_expose_ip     = true
  # should_create_parameter_group = false
  default_parameter_group       = "mysql8.0"
  username                      = "<!--your_username-->"
  password                      = "<!--your_password-->"
  engine_version                = "8.0.25"
  engine                        = "mysql"
  # should_create_option_group    = false
  default_option_group          = "8.0"
  db_name                       = "test_db"
  port                          = "3306"
  subnet_group_name             = "default_rds"
  vpc_id                        = "<!--your_vpc_id-->"
}
