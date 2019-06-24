// Generate IAM configmap from Terraform configuration

locals {
  config_map_aws_auth = <<CONFIGMAPAWSAUTH


apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${aws_iam_role.demo-node.arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
CONFIGMAPAWSAUTH
}

resource "local_file" "kube_auth_config" {
    content     = "${local.config_map_aws_auth}"
    filename = "${path.module}/config_map_aws_auth.yml"
}

# Apply with kubectl apply -f config_map_aws_auth.yaml
# Check with kubectl get nodes --watch
