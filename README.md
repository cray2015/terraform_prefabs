# Terraform Prefabs
This repository will contain sample modules to support the basic infrastructure layer of any organization. 

## How to use?
To achieve greater control on the infastructure, these scripts are divided into individual resources such as ec2, rds etc. To run the script go in to the actual resource definition. 
For example if you need to create the sample test_ec2 instance then move in to the ec2/test_ec2 directory then run the terraform commands.

## Commands
    $terraform init
    $terraform plan
    $terraform apply

## Structure
* The repo is structured in such way that the invidual modules will reside in the "modules" directory in order to reutilize the code and avoid duplication.
* You can checkout the variables.tf file in order to check the available variables of the module this is similar to calling a function with different parameters. 
* If you need more control you can add more variables.
* Outputs.tf will help you provide property which will be required everytime so that you need to access the UI console of the cloud provider

## Notes
- The EC2 instances are capable of both x86 and arm architectures, just pass the required variable.
- Currently the EC2 instance module uses the Ubuntu 20.04 OS
- the placeholders are marked as \<!--placeholder-->, please replace it with your own values.

## Future plans
* In the coming days you will get to see more infra scripts from multiple cloud vendors such as GCP, Azure and Alibaba Cloud
* More services such as lambda, efs, Cloudfront, S3 etc will be included in the aws provider
* Bug fixes
* Stacks will be created

Kindly report for any bugs or issues in the Issues section, I will get back to you ASAP. 

Check out the official documentation of terraform to learn more - https://www.terraform.io/docs