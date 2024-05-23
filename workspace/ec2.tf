resource "aws_instance" "Instance" {

    ami = "ami-090252cbe067a9e58"
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = ["sg-0fdf18ffe954458d7"]
  

    tags = {
        Name= "db"
}

}