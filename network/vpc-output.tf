output "aws_gss" {
  value = aws_vpc.aws_gss.id
}

output "public-subnet" {
  value = "${aws_subnet.public-subnet.*.id}"
}