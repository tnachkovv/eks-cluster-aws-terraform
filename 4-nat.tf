resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "ep-nat-eip-dev-k8s"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-eu-central-1a.id

  tags = {
    Name = "ep-nat-dev-k8s"
  }

  depends_on = [aws_internet_gateway.igw]
}
