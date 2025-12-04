apply:
	git pull
	rm -rf .terraform
	terraform init -backend-config="./modules/environment/terraform-state.conf"
	terraform apply -auto-approve -var-file ./modules/environment/dev/main.tfvars
destroy:
	git pull
	terraform init
	terraform destroy -auto-approve