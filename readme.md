In this project, I use Infrastructure as Code (IaC) with Terraform to deploy a simple Python Flask app on an EC2 instance within a VPC.
VPC Setup:

    Create a VPC and connect it to the internet.
    Configure the following components:
       1. Main route table
       2. Public subnet
       3. Security groups

The EC2 instance is placed in the public subnet, which is linked to the main route table and an Internet Gateway (IGW) to allow internet access.

**Terraform Provisioners:**
I leveraged Terraform provisioners to remotely SSH into the EC2 instance. Using the remote-exec provisioner, I uploaded the Python Flask app and performed the necessary installations. This was achieved using a locally generated SSH public key.
Steps:

    1. Connect to the EC2 instance within the VPC.
    2. Upload the Python file.
    3. Execute Linux commands to update packages, install Flask, and launch the app on the EC2 instance.

<img width="658" alt="Screenshot 2024-10-10 at 5 38 28 AM" src="https://github.com/user-attachments/assets/d3a1f20c-f522-46a3-a985-dac795aa258e">


**SECURITY**:

The project’s Terraform state file is stored in an S3 bucket, with DynamoDB used for state locking. This setup helps prevent accidental deletions and reduces the risk of concurrent access, ensuring only one operation can modify the state file at a time.

Special Thanks to Abhisheek Veeramalla




  
