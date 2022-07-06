# How to deploy a instance in Apache Cloudstack using Terraform?

## What is Terraform?

Terraform is an open-source infrastructure as a code (IAC) tool that allows to create, manage & deploy the production-ready environment. Terraform codifies cloud APIs into declarative configuration files. Terraform can manage both existing service providers and custom in-house solutions.

<img width="600" alt="image" src="https://user-images.githubusercontent.com/106381638/177545983-83ef71a9-9d21-4f65-a06c-65fa967b5897.png">

## What is Apache Cloudstack?

Apache cloudstack is an open source software designed to deploy and manage large networks of virtual machines, as a highly available, highly scalable Infrastructure as a Service (IaaS) cloud computing platform.

![image](https://user-images.githubusercontent.com/106381638/177546093-e88140e8-36d4-4cae-9ad8-656bdd5e448d.png)

Users can manage their cloud with an easy to use Web interface, command line tools, and/or a full-featured RESTful API. In addition, CloudStack provides an API that's compatible with AWS EC2 and S3 for organizations that wish to deploy hybrid clouds.

## Prerequisites:
	• Basic knowledge of apache cloustack & Terraform
	• A running cloudstack server
	• Cloudstack server API key & Secret key

To install the CloudStack provider, copy and paste the below code into your Terraform configuration file.

    terraform {
      required_providers {
        cloudstack = {
          source = "cloudstack/cloudstack"
          version = "0.4.0"
        }
      }
    }

    provider "cloudstack" {
      # Configuration options
    }
For more details on how to install and use this provider, visit  https://registry.terraform.io/providers/cloudstack/cloudstack/latest/docs

# Sample Terraform configuration

Below is an example configuration to initialize provider and create a Virtual Machine instance in cloudstack using terraform.

    terraform {
      required_providers {
        cloudstack = {
          source = "cloudstack/cloudstack"
          version = "0.4.0"
        }
      }
    }
 
    provider "cloudstack" {
      api_url    = "${var.cloudstack_api_url}"
      api_key    = "${var.cloudstack_api_key}"
      secret_key = "${var.cloudstack_secret_key}"

    }
 
    resource "cloudstack_instance" "webserver" {
      service_offering="52e73f1f-eba5-4e65-bf7e-2e59b559f011"
      template="214f9dd2-1078-11ec-ad9d-1e005f00006a"
      zone="0ec57f89-3433-4bdd-980d-1ec865b849f9"
      network_id="457215dd-4657-4a8a-8d3f-013bfd47747d"
      display_name="VM_From_Terraform"
      name="Terraform-instance"
    }

Note: It’s always better to define the variables in *.auto.tfvars or terraform.tfvars files rather than mentioning in the main configuration file.

Note: You can get the api_key and secret_key using the getUserKeys command. For more details on api reference, visit https://cloudstack.apache.org/api/apidocs-4.11/apis/getUserKeys.html 



So, now our code is ready. We need to run the below steps to create infrastructure.

$terraform init      to initialize the working directory and downloading plugins of the provider

$terraform plan      to create the execution plan for our code

$terraform apply     to create the actual infrastructure

Now we can login to our cloudstack server and confirm the VM status.

<img width="1235" alt="Screenshot 2022-07-06 at 6 30 13 PM" src="https://user-images.githubusercontent.com/106381638/177559281-af27f13c-f2dc-4bc1-b24a-0365ee856ce3.png">


