GOGS_ENV?=dev-01-europe-west1-gogs

init:
	sed -i 's|GOGS_ENV|$(GOGS_ENV)|g' backend.conf
	terraform init -backend-config=backend.conf -no-color
	terraform workspace select -or-create ${GOGS_ENV}

plan: init
	terraform plan -var-file=./workspace_vars/$(GOGS_ENV).json -no-color

apply: init
	terraform apply -var-file=./workspace_vars/$(GOGS_ENV).json -auto-approve -no-color
destroy: init
	terraform destroy -var-file=./workspace_vars/$(GOGS_ENV).json -auto-approve -no-color