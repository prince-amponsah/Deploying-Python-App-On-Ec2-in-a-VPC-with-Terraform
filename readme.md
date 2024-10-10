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

<img width="658" alt="Screenshot 2024-10-10 at 5 38 28 AM" src="https://github.com/user-attachments/assets/d3a1f20c-f522-46a3-a985-dac795aa258e">

  
