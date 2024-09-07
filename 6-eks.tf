resource "aws_iam_role" "ep-eks" {
  name = "eks-cluster-ep-dev"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "ep-eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.ep-eks.name
}

resource "aws_eks_cluster" "eks-cluster" {
  name     = "ep-eks-cluster-dev"
  role_arn = aws_iam_role.ep-eks.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-eu-central-1a.id,
      aws_subnet.private-eu-central-1b.id,
      aws_subnet.public-eu-central-1a.id,
      aws_subnet.public-eu-central-1b.id
    ]
  
  }

  depends_on = [aws_iam_role_policy_attachment.ep-eks-AmazonEKSClusterPolicy]
}
