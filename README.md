### Terraform Import Block

- Launch a `t2.micro` EC2 instance with `Amazon Linux 2023` ami.

- Update the `main.tf` file as below.

```go
import {
  to = aws_instance.example
  id = "i-0d783f4cdae5f40d8"
}

resource "aws_instance" "example" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  # (resource arguments...)
}
```

- Run the command `terraform plan` and `terraform apply`.

```bash
terraform plan

terraform apply
```

- Check the terraform.tfstate. The ec2 instance is now in your Terraform state.

```bash
terraform state list
```

- Import is successful. Go to the terminal and terminate your infrastructure.

```bash
terraform destroy
```

> Note: The import block records that Terraform imported the resource and did not create it. After importing, you can optionally remove import blocks from your configuration or leave them as a record of the resource's origin.

### -generate-config-out

> Experimental: While we do not expect to make backwards-incompatible changes to syntax, the -generate-config-out flag and how Terraform processes imports during the plan stage and generates configuration may change in future releases.

- Let's produce configuration file using `-generate-config-out` option.

- Go to the AWS console and create a security group named `terraform-sg`.

- Update the `main.tf` file as below.

```go
import {
  to = aws_security_group.mysg
  id = "sg-04857a39a743f07c2"
}
```

- Produce configuration file for `terraform-sg` security group.

```bash
terraform plan -generate-config-out=terraform-sg.tf
```

- Check the `terraform-sg.tf` file.

- Run the command `terraform plan` and `terraform apply`.

```bash
terraform plan

terraform apply
```

- Check the terraform.tfstate. The sg is now in your Terraform state.

```bash
terraform state list
```

- Import is successful. Go to the terminal and terminate your infrastructure.

```bash
terraform destroy
```
