terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  identifier = var.tags["Name"]

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.type
  allocated_storage = var.hdd_size

  # does not work
  # db_name  = var.db_name
  username = var.username
  password = var.password
  port     = var.port

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  #   monitoring_interval = "30"
  #   monitoring_role_name = "MyRDSMonitoringRole"
  #   create_monitoring_role = true

  tags = var.tags

  subnet_ids = data.aws_subnets.default_subnets.ids

  # DB parameter group
  create_db_parameter_group = var.should_create_parameter_group
  family                    = var.default_parameter_group

  # DB option group
  major_engine_version = var.default_option_group

  # Database Deletion Protection
  deletion_protection = var.is_termination_protected

  publicly_accessible = var.should_publicly_expose_ip

}
