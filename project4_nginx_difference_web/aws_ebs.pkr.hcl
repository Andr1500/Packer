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
  "sudo yum -y update",
  "sudo amazon-linux-extras install epel -y",
  "sudo yum-config-manager --enable epel",
  "sudo yum –y install nginx",
  "sudo systemctl start nginx"
  ]
  }
}
