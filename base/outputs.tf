output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "public_subnet_ids" {
  value = [aws_subnet.subnet-public-a.id, aws_subnet.subnet-public-b.id, aws_subnet.subnet-public-c.id]
}

output "public_subnet_azs" {
  value = [aws_subnet.subnet-public-a.availability_zone, aws_subnet.subnet-public-b.availability_zone, aws_subnet.subnet-public-c.availability_zone]
}

output "security_group_id_ssh" {
  value = aws_security_group.ssh_inbound.id
}

output "security_group_id_http" {
  value = aws_security_group.http_inbound.id
}

output "security_group_id_http_lb" {
  value = aws_security_group.lb_http_inbound.id
}

output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.instance_profile.name
}

output "key_name" {
  value = aws_key_pair.kp.key_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.epam-tf-lab-bucket.bucket
}
