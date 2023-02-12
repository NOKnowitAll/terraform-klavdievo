## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
# Output for final project

resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
  {
    jenkins_name   = "${module.fp_instances.jenkins_name}",
    jenkins_ip     = "${module.fp_instances.jenkins_ip}",
    prodserver_name = "${module.fp_instances.prodserver_name}",
    prodserver_ip   = "${module.fp_instances.prodserver_ip}"    
   }
  )
  filename         = pathexpand("./files_of_project/inventory.ini")
}

