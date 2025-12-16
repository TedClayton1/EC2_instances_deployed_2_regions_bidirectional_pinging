
# Cross-Region AWS EC2 Connectivity with Terraform 


This project demonstrates how to deploy and connect EC2 instances in different AWS regions using Terraform and VPC peering.
Two EC2 instances—one in us-east-1 and one in ap-southeast-2—are deployed into custom VPCs and configured to ping each other using private IP addresses.

The goal is to validate secure, private, cross-region connectivity without using the public internet.






## Acknowledgements

 - [Hashicorp Reference A](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-create)
 
 - [Hashicorp Reference B](https://discuss.hashicorp.com/t/creating-multiple-instances-in-multiple-regions/27640)


## Used By

This project is used by the following companies:

- Ted L Clayton Inc






## Tech Stack

**Client:** Terraform, Git Bash, Visual Studio Code
**Server-Side:** AWS EC2, AWS VPC, VPC Peering, Security Groups and Amazon Linux 2



## Deployment

Prerequisites:
*1.AWS CLI configured with valid credentials
*2.Terraform installed (>= 1.x)
*3.Two EC2 key pairs created:
*4.One in us-east-1
*5.One in ap-southeast-2

Steps:
*1.Open Visual Studio Code from GitBash with the "code" command.
*2.```bash terraform init (tfi for short in this case)
*3.```bash terraform validate
*4.```bash terraform plan
*5.```bash terraform apply
*6.Verify the .pem file for EC2 #1 has the correct permissions with the "chmod" command
*7.From my local machine SSH or remote into the US East Instance (virtual machine)
*8.From US East Instance (virtual machine) ping the AP Southeast Instance (virtual machine)
with the "ping" command. The packets (3) transmitted are proof of this.
*9.Exit us-east-1 server(virtual machine) and go back to my local machine (my laptop).
*10.Verify the .pem file for EC2 #2 has the correct permissions with the "chmod" command.
*11.From my local machine (laptop) SSH or remote into the AP-Southeast (virtual machine)
*12.From AP-Southeast (virtual machine) ping the US-East instance with the "ping" command. The packets (3) are proof of this.
*13.Exit the ap-southeast virtual machine and return to my local machine (laptop)
*14.Deployment was a major success with drawing of the infrastructure :)! 






## Screenshots

![Step 1] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2s%20different%20region%20ping%201.PNG)

![Step 2] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2s%20different%20region%20ping%202.PNG)

![Step 3] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2s%20different%20region%20ping%203.PNG)

![Step 4] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2s%20different%20region%20ping%204.PNG)

![Step 5] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2s%20different%20region%20ping%205.PNG)

![Step 6] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2s%20different%20region%20ping%206.PNG)

![Step 7] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2s%20different%20region%20ping%207%20successful%20remote%20into%20us-east-1%20instance.PNG)

![Step 8] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2%20us-east-1%20successfully%20pinged%20ap-southeast%20instance%208.PNG)

![Step 9] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2%20exit%20us-east%20server%20and%20go%20back%20to%20my%20local%20machine%209.PNG)

![Step 10] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2%20verified%20permission%20for%20EC2%20pem%20file%20for%20EC2%2010.PNG)

![Step 11] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2%20successfully%20ssh%20into%20ap-southeast%20instance%2011.PNG)

![Step 12] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2%20successfully%20pinged%20us-east-1%20from%20ap-southeast%2012.PNG)



![Step 13] (https://github.com/TedClayton1/EC2_instances_deployed_2_regions_bidirectional_pinging/blob/90302b3cadfbf20b9024287099553c5182b7a6b5/EC2%20exit%20ap-southeast%20machine%20and%20back%20to%20my%20laptop%2013.PNG)

![Architecture Diagram](architecture/architecture-diagram.png)


