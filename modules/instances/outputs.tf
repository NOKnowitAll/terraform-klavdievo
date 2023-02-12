## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
# Output for final project

output "jenkins_name" {
  value = "${aws_instance.jenkins.tags.Name}"
}

output "jenkins_ip" {
  value = "${aws_instance.jenkins.private_ip}"
}

output "prodserver_name" {
  value = "${aws_instance.prodserver.tags.Name}"
}

output "prodserver_ip" {
  value = "${aws_instance.prodserver.private_ip}"
}

