GOGS_ENV?=dev-01-europe-west4-gogs
WORK_DIR=${GOGS_ENV}/gogs 
init:
	terragrunt init --terragrunt-working-dir ${WORK_DIR}
plan: init
	terragrunt plan --terragrunt-working-dir ${WORK_DIR}
apply: init
	terragrunt apply --terragrunt-working-dir ${WORK_DIR}
destroy: init
	terragrunt destroy --target google_container_cluster.my_cluster --terragrunt-working-dir ${WORK_DIR}
	terragrunt destroy --terragrunt-working-dir ${WORK_DIR}