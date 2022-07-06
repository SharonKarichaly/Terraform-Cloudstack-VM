#deploying an instance using terraform
 
terraform {
  required_providers {
    cloudstack = {
      source = "cloudstack/cloudstack"
      version = "0.4.0"
    }
  }
}

#Fetch the api_key and secret_key using the getUserKeys command.visit https://cloudstack.apache.org/api/apidocs-4.11/apis/getUserKeys.html for details

provider "cloudstack" {
  api_url    = " http://management-server-IP:port/client/api"
  api_key    = "XXXXXX"
  secret_key = "XXXXXX"
}
 
resource "cloudstack_instance" "webserver" {
  service_offering="52e73f1f-eba5-4e65-bf7e-2e59b559f011"
  template="214f9dd2-1078-11ec-ad9d-1e005f00006a"
  zone="0ec57f89-3433-4bdd-980d-1ec865b849f9"
  network_id="457215dd-4657-4a8a-8d3f-013bfd47747d"
  display_name="VM_From_Terraform"
  name="Terraform-instance"
}
