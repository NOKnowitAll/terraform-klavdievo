## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
# Output for final project - security-group

output "ssh_access_id" {
  value = "${aws_security_group.ssh_access.id}"
}

output "jenkins_access_id" {
  value = "${aws_security_group.jenkins_access.id}"
}

output "web_servers_id" {
  value = "${aws_security_group.web_servers.id}"
}