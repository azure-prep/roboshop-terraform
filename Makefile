apply:
	git pull
	terraform init
	terraform apply -auto-approve
destroy:
	git pull
	terraform apply
	terraform destroy -auto-approve