
PRE=aws-vault exec personal

plan:
	$(PRE) terraform plan

apply:
	$(PRE) terraform apply

destroy:
	$(PRE) terraform destroy

configure:
	$(PRE) kubectl apply -f config_map_aws_auth.yaml

nodes:
	$(PRE) kubectl get nodes --watch

