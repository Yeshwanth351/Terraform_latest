# Demo Ubuntu Server(t2.medium)
resource "aws_instance" "my_Server" {
  count                  = 1
  ami                    = var.ubuntuami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_with_tcp.id]
  subnet_id              = element(aws_subnet.subnets.*.id, count.index)
  key_name               = var.key_name

  tags = {
    Name = "myserver1"
  }

}
# 2 Instance Of Redhat Servers(t2.micro)
resource "aws_instance" "my_server2" {
  count                  = 1
  ami                    = var.redhatami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_with_tcp.id]
  subnet_id              = element(aws_subnet.subnets.*.id, count.index)
  key_name               = var.key_name
  tags = {
    Name = "Redhat_Server_${count.index + 1}"
  }


}
