#
#resource "aws_eks_cluster" "example" {
#  name     = "example-cluster"
#  role_arn = aws_iam_role.example.arn
#
#  vpc_config {
#    subnet_ids = aws_subnet.example.*.id
#  }
#}
#
## resource "aws_iam_role" "example" {
##   name = "example-role"
##
##   assume_role_policy = jsonencode({
##     Statement = [
##       {
##         Action = "sts:AssumeRole",
##         Effect = "Allow",
##         Principal = {
##           Service = "eks.amazonaws.com"
##         }
##       }
##     ],
##     Version = "2012-10-17"
##   })
## }
#
## Define the first IAM user
#resource "aws_iam_user" "jonathan" {
#  name = "jonathan"
#}
#
#resource "aws_iam_user_policy_attachment" "user_abc_policy" {
#  user       = aws_iam_user.jonathan.name
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterAdminPolicy"
#}
#
## Define the second IAM user
#resource "aws_iam_user" "jolchin" {
#  name = "jolchin"
#}
#
#resource "aws_iam_user_policy_attachment" "user_def_policy" {
#  user       = aws_iam_user.jolchin.name
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterAdminPolicy"
#}
#
#provider "kubernetes" {
#  host                   = aws_eks_cluster.example.endpoint
#  token                  = data.aws_eks_cluster_auth.example.token
#  cluster_ca_certificate = base64decode(aws_eks_cluster.example.certificate_authority[0].data)
#}
#
#data "aws_eks_cluster_auth" "example" {
#  name = aws_eks_cluster.example.name
#}
#
#resource "kubernetes_config_map" "aws_auth" {
#  metadata {
#    name      = "aws-auth"
#    namespace = "kube-system"
#  }
#
#  data = {
#    mapRoles = jsonencode([
#      {
#        rolearn  = aws_iam_role.example.arn
#        username = "system:node:{{EC2PrivateDNSName}}"
#        groups   = ["system:bootstrappers", "system:nodes"]
#      }
#    ])
#
#    mapUsers = jsonencode([
#      {
#        userarn  = "arn:aws:iam::123456788:user/abc"
#        username = "abc"
#        groups   = ["system:masters"]
#      },
#      {
#        userarn  = "arn:aws:iam::123456788:user/def"
#        username = "def"
#        groups   = ["system:masters"]
#      }
#    ])
#  }
#}