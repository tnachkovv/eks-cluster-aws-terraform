resource "aws_subnet" "private-eu-central-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "eu-central-1a"

  tags = {
    "Name"                            = "ep-private-eu-central-1a-k8s"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/ep-eks-cluster-dev"      = "owned"
  }
}

resource "aws_subnet" "private-eu-central-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "eu-central-1b"

  tags = {
    "Name"                            = "ep-private-eu-central-1b-k8s"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/ep-eks-cluster-dev"      = "owned"
  }
}

resource "aws_subnet" "public-eu-central-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "ep-public-eu-central-1a-k8s"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/ep-eks-cluster-dev" = "owned"
  }
}

resource "aws_subnet" "public-eu-central-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "ep-public-eu-central-1b-k8s"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/ep-eks-cluster-dev" = "owned"
  }
}
