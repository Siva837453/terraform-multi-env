resource "aws_instance" "expense" {

    for_each = var.instance_name
    ami = data.aws_ami.ami_info.id
    instance_type = each.value
    vpc_security_group_ids = [ "sg-0fdf18ffe954458d7"]

    tags = merge(

        var.common_tags,{

            Name = "${each.key}"
            Module = "${each.key}"
            Environment= var.environment
        }
    )
}







