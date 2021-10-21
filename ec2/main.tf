provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.key.key_name
  subnet_id = var.subnet_id
  /* iam_instance_profile = */ 
  vpc_security_group_ids = var.ec2_sg
  /* user_data = file("${var.user_data_file}") */

  tags = {
    Terraform   = "true"
    Name = var.app_name
  }
}

resource "aws_key_pair" "key" {
  key_name   = "${var.app_name}-key"
  public_key = file(var.public_key_file)
}

/* resource "aws_security_group" "sg" { */
/*   name        = "${var.app_name}-sg" */
/*   vpc_id      = var.vpc_id */

/*   ingress { */
/*     from_port   = 22 */
/*     to_port     = 22 */
/*     protocol    = "tcp" */
/*     cidr_blocks = [ */
/*       "186.104.184.48/32", */
/*       "54.186.99.92/32" */
/*     ] */
/*   } */

/*   ingress { */
/*     from_port   = 0 */
/*     to_port     = 0 */
/*     protocol    = "-1" */
/*     security_groups = [var.other_sg] */
/*   } */

/*   egress { */
/*     from_port   = 0 */
/*     to_port     = 0 */
/*     protocol    = "-1" */
/*     cidr_blocks = ["0.0.0.0/0"] */
/*     prefix_list_ids = [] */
/*   } */

/*   tags = { */
/*     Terraform   = "true" */
/*     Name = var.app_name */
/*   } */
/* } */

/* data "aws_iam_policy_document" "ec2_assume_role" { */
/*   statement { */
/*     actions = ["sts:AssumeRole"] */

/*     principals { */
/*       type        = "Service" */
/*       identifiers = ["ec2.amazonaws.com"] */
/*     } */
/*   } */
/* } */

/* resource "aws_iam_policy" "ec2_policy" { */
/*   name        = "${var.app_name}-ec2-policy" */
/*   description = "Jmeter EC2 connect to ECR and S3" */
/*   policy      = <<EOF */
/* { */
/*   "Version": "2012-10-17", */
/*   "Statement": [ */
/*     { */
/*       "Effect": "Allow", */
/*       "Action": [ */
/*         "ecr:*" */
/*       ], */
/*       "Resource": "*" */
/*     }, */
/*     { */
/*       "Effect": "Allow", */
/*       "Action": [ */
/*         "s3:GetBucketLocation", */
/*         "s3:ListAllMyBuckets" */
/*       ], */
/*       "Resource": "*" */
/*     }, */
/*     { */
/*       "Effect": "Allow", */
/*       "Action": ["s3:ListBucket"], */
/*       "Resource": ["arn:aws:s3:::jmeter-bucket"] */
/*     }, */
/*     { */
/*       "Effect": "Allow", */
/*       "Action": [ */
/*         "s3:PutObject", */
/*         "s3:GetObject" */
/*       ], */
/*       "Resource": ["arn:aws:s3:::jmeter-bucket/*"] */
/*     } */
/*   ] */
/* } */
/* EOF */
/* } */

/* resource "aws_iam_role" "ec2_role" { */
/*   name               = "${var.app_name}-ec2-role" */
/*   assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json */
/* } */

/* resource "aws_iam_role_policy_attachment" "ec2_attach" { */
/*   role      = aws_iam_role.ec2_role.name */
/*   policy_arn = aws_iam_policy.ec2_policy.arn */
/* } */

/* resource "aws_iam_instance_profile" "ec2_profile" { */
/*   name = "${var.app_name}-ec2-profile" */
/*   role = aws_iam_role.ec2_role.name */
/* } */
