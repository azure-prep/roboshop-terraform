apply:
	git pull
	rm -rf .terraform
	terraform init  -backend-config=environment/dev/terraform-state.tfvars
	terraform apply -auto-approve -var-file environment/dev/main.tfvars -var token=${token}
destroy:
	git pull
	terraform init  -backend-config=environment/dev/terraform-state.tfvars
	terraform destroy -auto-approve -var-file environment/dev/main.tfvars -var token=${token}