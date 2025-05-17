terraform {
  backend "s3" {
    bucket  = "your-bucket-name"    //replace here with your bcket name
    key     = "vpc-alb-ec2/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}