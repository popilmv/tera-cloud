# tera-cloud
This repository contain information on the deploy VM in google project by terraform

Precondition:
1. You must have a cluster in Google Cloud
2. Install utility which will be used in work
```
apt install  software-properties-common gnupg2 curl
apt-get install google-cloud-cli
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash
```

Check ```terraform --version```
In **index.tf** - information about which VM we should get as a result is described
provider = indicate in which cloud environment we will work ([All providers by link](https://registry.terraform.io/browse/providers)) 
resource = infrastructure description - network, machine type, region, etc

**service-account-key.json** The key that you create in your personal account and upload to the project provides access to resources in your Google Cloud account and is used to perform actions in the Google cloud environment. 
(Instruction about service-account-key) [https://cloud.google.com/iam/docs/keys-create-delete]

**vars.tf** information about the variables that we can change in this file and they will be applied in index.tf in next apply.

So, the next commands you need to deploy:
1. You can validate you configuration:
```
terraform validate
```
3. Project initialization
```
terraform init
```
5. Output of information about the changes that will be implemented (action plan)
```
terraform plan
```
7. If there are no errors at the previous stages, we confirm with command:
```
terraform apply
```
