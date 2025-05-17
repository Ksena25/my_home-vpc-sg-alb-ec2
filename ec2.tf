# EC2 Instance
resource "aws_instance" "main-ec2" {
  ami                    = "ami-0e58b56aa4d64231b" # Amazon Linux 2 AMI
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.pubsub2.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  user_data              = <<-EOF
              #!/bin/bash
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from Terraform</h1>" > /var/www/html/index.html
              EOF
  tags = {
    Name = "web-server"
  }
}
resource "aws_lb_target_group_attachment" "main-tga" {
  target_group_arn = aws_lb_target_group.main-tgr.arn
  target_id        = aws_instance.main-ec2.id
  port             = 80
}
