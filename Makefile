apply:
	git pull
	rm -rf .terraform
	terraform init -backend-config=environment/terraform-state.tfvars
	terraform apply -auto-approve -var-file environment/dev/main.tfvars
destroy:
	git pull
	terraform init
	terraform destroy -auto-approve