# -------------------------------------------------
# SECURITY GROUP
# -------------------------------------------------

resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -------------------------------------------------
# WORDPRESS INSTALLATION SCRIPT
# -------------------------------------------------

locals {
  wordpress_install = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install lamp-mariadb10.2-php7.2 php7.2 -y
              yum install -y httpd mariadb-server
              systemctl start httpd
              systemctl enable httpd

              cd /var/www/html
              wget https://wordpress.org/latest.tar.gz
              tar -xzf latest.tar.gz
              cp -r wordpress/* .
              rm -rf wordpress latest.tar.gz
              chown -R apache:apache /var/www/html
              EOF
}

# -------------------------------------------------
# PRODUCTION WORDPRESS INSTANCE
# -------------------------------------------------

resource "aws_instance" "wordpress_prod" {

  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.wordpress_sg.id
  ]

  user_data = local.wordpress_install

  tags = {
    Name = "WordPress-Production"
  }
}

# -------------------------------------------------
# DEVELOPMENT WORDPRESS INSTANCE
# -------------------------------------------------

resource "aws_instance" "wordpress_dev" {

  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.wordpress_sg.id
  ]

  user_data = local.wordpress_install

  tags = {
    Name = "WordPress-Development"
  }
}