import {
  to = aws_instance.example
  id = "i-0d783f4cdae5f40d8"
}

resource "aws_instance" "example" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  # (resource arguments...)
}

import {
  to = aws_security_group.mysg
  id = "sg-041c26df9a7789090"
}