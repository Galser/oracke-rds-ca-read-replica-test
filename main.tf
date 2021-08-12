# ticket 52439

# From apply log 
#        engine                                = "oracle-ee"
#        engine_version                        = "12.1.0.2.v10"
#


terraform {
  #  required_version = "0.12.31" # user has 0.12.29
  # tested in several versions up to 1.0.4
  required_version = "1.0.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.53"
    }
  }
}

# AWS
# 3.53 is latest
# version = "~> 3.00" # 3.53 is latest
# terraform-provider-aws_v3.47.0_x5 used by custoemr

provider "aws" {
  region = "eu-central-1" # define your region 
}


# Same setting for passwd as with customer
resource "random_password" "db_master_pwd" {
  length  = 16
  special = false
}

## STEP 1 - add main instance  
resource "aws_db_instance" "main" {
  allocated_storage       = 50
  engine                  = "oracle-ee"
  engine_version          = "12.1.0.2.v10"
  instance_class          = "db.m4.xlarge"
  name                    = "MAINDB"
  username                = "oadmin"
  password                = random_password.db_master_pwd.result
  skip_final_snapshot     = true
  apply_immediately       = true
  backup_retention_period = 3

  parameter_group_name = "default.oracle-ee-12.1"
  character_set_name   = "AL32UTF8"
  timeouts {
    update = "120m"
  }
  ca_cert_identifier = "rds-ca-2019"
}


## STEP 2 - Add read replica
resource "aws_db_instance" "read" {

  engine              = "oracle-ee"
  engine_version      = "12.1.0.2.v10"
  instance_class      = "db.m4.large"
  name                = "READ"
  username            = "oadmin"
  identifier          = "test-rds-read-0"
  skip_final_snapshot = true
  apply_immediately   = true

  allocated_storage   = 50
  replicate_source_db = aws_db_instance.main.id

  # Combination of "parameter_group_name" + "ca_cert_identifier" 
  # makes it fail 
  parameter_group_name = "default.oracle-ee-12.1"
  ca_cert_identifier   = "rds-ca-2019"

  timeouts {
    update = "120m"
  }

}
