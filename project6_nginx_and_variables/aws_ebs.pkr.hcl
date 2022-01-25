source "amazon-ebs" "basic-example" {
  region =  "eu-central-1"
  source_ami =  "ami-05d34d340fb1d89e5"
  instance_type =  "t3.micro"
  ssh_username =  "ec2-user"
  ami_name =  "packer_amazon_linux_nginx_{{timestamp}}"
  tags = {
      OS_Version = "RedHat"
      Release = "Latest"
      Base_AMI_Name = "{{ .SourceAMIName }}"
      Extra = "{{ .SourceAMITags.TagName }}"
  }
}

build {
  sources = [
    "source.amazon-ebs.basic-example"
  ]
  provisioner "shell" {
  inline  = [
  "sleep 30",
  "sudo yum update -y",
  "sleep 30",
  "sudo amazon-linux-extras enable epel",
  "sudo yum install epel-release -y",
  "sudo yum install nginx -y",
  "sudo systemctl start nginx"
  ]
  }
}
