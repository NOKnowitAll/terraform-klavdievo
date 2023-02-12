## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
# Output for final project - networking

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "subnet_id" {
  value = "${aws_subnet.subnet.id}"
}





