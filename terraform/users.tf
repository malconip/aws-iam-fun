#Creating users
resource "aws_iam_user" "newusers" {
  count = length(var.username)
  name  = element(var.username, count.index)
}

resource "aws_iam_user_policy_attachment" "ec2-user-full" {
  count      = length(var.username)
  user       = element(aws_iam_user.newusers.*.name, count.index)
  policy_arn = aws_iam_policy.ec2_full.arn
}

#Creating read only users
resource "aws_iam_user" "readonlynewusers" {
  count = length(var.readonlyusername)
  name  = element(var.readonlyusername, count.index)
}

resource "aws_iam_user_policy_attachment" "read-only" {
  count      = length(var.readonlyusername)
  user       = element(aws_iam_user.readonlynewusers.*.name, count.index)
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
