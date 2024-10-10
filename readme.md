In this project I'm laveraging the use of Iac - Terraform to deploy a simple python flask app unto an EC2 within a VPC.

Create a Vpc, Connec and Internet to the VPC to allow internet to flow in and also setup the following;
1. main route table
2. public subnet
3. Seecurity groups. 
Our Ec2 will be in a public subnet which is connected to the main route table which is also connected to IGW to allow internet into the VPC.

**Terraform Provisioners**:
I utilized the use of Terraform Provisioners to remote ssh  into the instance and upload the python file and also run all installations with "Remote Exec".
This gives me the opportunity to run all commands remotely using a locally generates ssh public key.

Connection to Launched EC2 and taking the folloeing actions;
1. upload python file
2. run Linux commands and also update packages before anyother further installations

connection {
    type        = "ssh"
    user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    private_key = file("~/.ssh/id_rsa")  # Replace with the path to your private key
    host        = self.public_ip
  }

  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "app.py"  
    destination = "/home/ubuntu/app.py"  

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",  # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip",  # Example package installation
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
  }

