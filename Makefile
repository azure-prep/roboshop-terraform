apply:
	git pull
	terraform init
	terraform apply -auto-approve -var-file .auto.tfvars
destroy:
	git pull
	terraform init
	terraform destroy -auto-approve