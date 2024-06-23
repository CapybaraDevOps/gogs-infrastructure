## AWX Terraform Deployment
*Use this Terraform module to deploy GKE cluster with AWX.*
Please note that you **must be** authorized with your **Google Service Account**.
#### Usage
1. Change variable ***project*** default in **vars.tf** to your project id

2. Edit bucket name in ***config.gcs.tfbackend*** to your bucket name. 
*(This bucket will store the Terraform state)*

3. Init Terraform with backend config
``
terraform init -backend-config=backend.conf -no-color
``

4. Apply Terraform configuration
``
terraform apply -auto-approve -no-color
``