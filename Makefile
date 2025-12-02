apply:
	git pull
	terraform apply -auto-approve
destroy:
	git pull
	terraform destroy -auto-approve