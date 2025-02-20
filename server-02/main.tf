provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "docker_sg" {
  name        = "docker-sg"
  description = "allow ssh and jenkins access"

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

resource "aws_instance" "docker_server" {
  ami           = "ami-053a45fff0a704a47"
  instance_type = "t2.micro"
  key_name      = "jenkins_server"
  security_groups = [aws_security_group.docker_sg.name]

  user_data = file("run-docker.sh")

  tags = {
    Name = "docker-server"
  }
}
