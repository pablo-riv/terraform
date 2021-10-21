# ami-0c2d06d50ce30b442 amazon-linux-2

app_name = "shopify"
region   = "us-west-2"
environment = "dev"

# instance
ami_id = "ami-0d7012c89929ac416"
instance_type = "t2.large"
subnet_id = "subnet-7ef57e09" 
user_data_file = "install-docker.sh"

# key_pair
public_key_file = "~/.ssh/dev-instances.pub"

#sg
vpc_id = "vpc-3dea7758"
other_sg = "sg-0677190f8c27d2d25" #shipit-prod-instances-sg

ec2_sg = ["sg-043c1ced679ee91ae", "sg-a0cf42d9"]
/* ec2_profile = */ 
