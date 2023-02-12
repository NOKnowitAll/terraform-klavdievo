## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
# Output for final project

# create private keys
resource "local_file" "private_key_file" {
  filename             = pathexpand("./files_of_project/klavdievo_key.pem")
  file_permission      = "400"
  directory_permission = "700"
  content              = tls_private_key.private_key.private_key_pem
}

output "key_name" {
  value                = "${aws_key_pair.generated_key.key_name}"
}


