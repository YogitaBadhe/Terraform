Here’s a detailed step-by-step `README.md` file for your Terraform project:

```markdown
# Terraform EC2 Instance Setup

This guide provides detailed steps to set up Terraform, launch an EC2 instance, and configure AWS CLI for managing infrastructure. 

---

## Prerequisites

Before you begin, ensure you have:
1. **Amazon Linux Instance**: An EC2 instance with Amazon Linux OS.
2. **AWS Account**: Access to your AWS Management Console.
3. **SSH Key Pair**: A key pair for connecting to the instance (`terraformkey`).
4. **Internet Access**: To install required packages and tools.

---

## Steps to Set Up and Execute

### 1. Launch an EC2 Instance
1. Open the AWS Management Console and navigate to **EC2**.
2. Click **Launch Instance** and configure the following:
   - **Name**: `Terraform`
   - **AMI**: Amazon Linux 2
   - **Instance Type**: `t2.micro`
   - **Key Pair**: Select or create a key pair named `terraformkey`.
   - **Security Group**: Allow SSH (port 22) for remote access.
3. Click **Launch Instance**.

Use your key pair to SSH into the instance:
```bash
ssh -i terraformkey.pem ec2-user@<EC2_PUBLIC_IP>
```

---

### 2. Install AWS CLI
Check if AWS CLI is installed:
```bash
aws --version
```
If not installed, follow these steps:
1. Update the instance:
   ```bash
   sudo yum update -y
   ```
2. Download and install the AWS CLI:
   ```bash
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   ```
3. Verify the installation:
   ```bash
   aws --version
   ```

For more details, refer to the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#cliv2-linux-install).

---

### 3. Install Terraform
1. Add the HashiCorp repository:
   ```bash
   sudo yum install -y yum-utils shadow-utils
   sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
   ```
2. Install Terraform:
   ```bash
   sudo yum -y install terraform
   ```
3. Verify the installation:
   ```bash
   terraform version
   ```

For more details, refer to the [Terraform installation guide](https://developer.hashicorp.com/terraform/install).

---

### 4. Create IAM User and Group
1. Log in to the **AWS Management Console**.
2. Navigate to **IAM**.

#### Create a User
1. Go to **Users** and click **Add Users**.
2. Enter the username: `Yogita`.
3. Select **Access Key - Programmatic Access**.
4. Click **Next**.

#### Create a Group and Attach Policy
1. Navigate to **User Groups** and click **Create Group**.
2. Enter a name for the group, e.g., `AdminGroup`.
3. Attach the **AdministratorAccess** policy to the group.
4. Add the user `Yogita` to the group.
5. Save the changes.

#### Create Access Keys
1. Go to the **User Details** page for `Yogita`.
2. Under **Security Credentials**, click **Create Access Key**.
3. Note down the **Access Key ID** and **Secret Access Key**.

---

### 5. Configure AWS CLI
Run the following command to configure AWS CLI:
```bash
aws configure
```
Enter the following details:
- **Access Key ID**: [Your Access Key ID]
- **Secret Access Key**: [Your Secret Access Key]
- **Region**: `us-east-1`
- **Output Format**: `json`

Verify the configuration:
```bash
aws s3 ls
```

---

### 6. Set Up Terraform Project
1. Create a project folder:
   ```bash
   mkdir project
   cd project
   ```
2. Create a `main.tf` file:
   ```bash
   touch main.tf
   nano main.tf
   ```
3. Paste the following code into `main.tf`:
   ```hcl
   terraform {
     required_providers {
       aws = {
         source = "hashicorp/aws"
         version = "5.78.0"
       }
     }
   }
   provider "aws" {
     region = "us-east-1"
   }
   ```

---

### 7. Execute Terraform Commands
1. Initialize Terraform:
   ```bash
   terraform init
   ```
2. Preview the execution plan:
   ```bash
   terraform plan
   ```
3. Apply the changes:
   ```bash
   terraform apply
   ```
   - Type `yes` when prompted.
4. To destroy the resources:
   ```bash
   terraform destroy
   ```
   - Type `yes` when prompted.

---

## Notes
- **Security**: Ensure your Access Keys are securely stored and not shared.
- **Cleanup**: Always destroy resources when they are no longer needed to avoid unnecessary charges.
- **Documentation**: Refer to Terraform [documentation](https://developer.hashicorp.com/terraform/docs) for advanced usage.
``` 

This detailed README provides clarity on every step required to complete your Terraform EC2 setup.
