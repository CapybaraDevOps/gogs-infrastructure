GOGS_ENV?=dev-01-europe-west1-gogs

init:
	terraform init -no-color
	terraform workspace select -or-create ${GOGS_ENV}
plan: init
	terraform plan -var-file=./workspace_vars/$(GOGS_ENV).json -no-color
apply: init
	terraform apply -auto-approve -no-color -var-file=./workspace_vars/$(GOGS_ENV).json
destroy: init
	terraform destroy -var-file=./workspace_vars/$(GOGS_ENV).json -auto-approve -no-color