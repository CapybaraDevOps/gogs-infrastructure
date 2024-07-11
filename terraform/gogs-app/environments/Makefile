GOGS_ENV?=dev-01-europe-west4-gogs
WORK_DIR=${GOGS_ENV}/gogs 
init:
	terragrunt init --terragrunt-working-dir ${WORK_DIR}
plan: init
	terragrunt plan --terragrunt-working-dir ${WORK_DIR}
apply: init
	terragrunt apply --terragrunt-working-dir ${WORK_DIR}
destroy: init
	terragrunt destroy --target google_container_cluster.my_cluster
	terragrunt destroy
destroy_helm: init
	#left for purpose of additional option to destroy only gogs-app
	terragrunt destroy --target helm_release.gogs-app --terragrunt-working-dir ${WORK_DIR}