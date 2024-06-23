init:
	cd ${GOGS_ENV}/gogs
	terragrunt init
plan: init
	terragrunt plan
apply: init
	terragrunt apply
destroy: init
	terragrunt destroy --target google_container_cluster.my_cluster
	terragrunt destroy