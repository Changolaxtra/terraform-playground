resource "aws_iam_group" "tf-iam-group" {
  name = "${local.StudentName}-${local.StudentSurname}-01-group"
}

resource "aws_iam_policy" "s3_policy" {
  name = "epam-aws-tf-lab-policy"
  policy = templatefile("${path.module}/files/s3Policy.json.tpl", {
    arn = "${aws_s3_bucket.epam-tf-lab-bucket.arn}"
  })
}

resource "aws_iam_role" "app_role" {
  name               = "approle"
  assume_role_policy = templatefile("${path.module}/files/assumeRolePolicy.json.tpl", {})
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.tf-iam-group.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "instance_profile"
  role = aws_iam_role.app_role.name
}

