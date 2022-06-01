# https://githubmemory.com/repo/terraform-aws-modules/terraform-aws-ec2-instance/issues/224
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# AMI
data "aws_ami" "ubuntu_x86" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ubuntu_arm" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


# security group
resource "aws_security_group" "ec2_default_rules" {

  dynamic "ingress" {
    for_each = var.security_group_ingress_rules
    content {
      from_port   = ingress.value.from
      to_port     = ingress.value.to
      cidr_blocks = ingress.value.cidr_range
      protocol    = ingress.value.protocol
      description = ingress.value.description
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.tags
}

resource "aws_eip" "this" {
  count    = var.need_eip ? 1 : 0
  vpc      = true
  instance = module.ec2_instance.id
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.tags["Name"]

  ami                     = var.is_arm_instance ? data.aws_ami.ubuntu_arm.id : data.aws_ami.ubuntu_x86.id
  instance_type           = var.type
  key_name                = var.keyname
  monitoring              = true
  vpc_security_group_ids  = [aws_security_group.ec2_default_rules.id]
  cpu_credits             = var.cpu_credits
  ebs_optimized           = var.is_ebs_optimized
  disable_api_termination = var.is_termination_protected
  iam_instance_profile    = var.iam_role
  enable_volume_tags      = false
  tags                    = var.tags
  root_block_device = [{
    delete_on_termination = true
    tags                  = var.tags
    volume_size           = var.hdd_size
  }]
}

