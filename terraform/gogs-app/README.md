## Gogs application Terraform Deployment
*Use this Terraform module to deploy GKE cluster with Gogs application.*
Please note that you **must be** authorized with your **Google Service Account**.
#### Usage
1. Change variable ***project*** default in **vars.tf** to your project id
**All necessary variables passed in Jenkins pipeline**

2. Edit bucket name in ***backend.conf*** to your bucket name. 
*(This bucket will store the Terraform state)*

3. Init Terraform with backend config
``
make init
``

4. Apply Terraform configuration
``
make apply
``