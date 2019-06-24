
PRE=aws-vault exec personal

plan:
	$(PRE) -- terraform plan

apply:
	$(PRE) -- terraform apply

destroy:
	$(PRE) -- terraform destroy

configure:
	$(PRE) -- kubectl --kubeconfig .kube/config apply -f config_map_aws_auth.yml

nodes:
	$(PRE) -- kubectl --kubeconfig .kube/config get nodes --watch

