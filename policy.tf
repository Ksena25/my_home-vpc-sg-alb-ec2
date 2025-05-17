
# IAM Policy for Terraform
data "aws_iam_policy_document" "terraform" {
  statement {
    actions = [
      "ec2:*",
      "elasticloadbalancing:*",
      "iam:*",
      "s3:*",
    ]
    resources = ["*"]
  }
}
resource "aws_iam_policy" "terraform" {
  name        = "TerraformDeploymentPolicy"
  description = "Policy for Terraform to deploy VPC, ALB, EC2"
  policy      = data.aws_iam_policy_document.terraform.json
}
