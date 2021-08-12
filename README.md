# oracle-rds-ca-read-replica-test
Testing the CA parameter influence on read-replica deploy for ticket 52439

# Introduction

This repository is demonstrating the potential bug in the AWS Provider, where resource with `parameter_group_name`  and `ca_cert_identifier` parameters defined in read replica for AWS RDS will fail to deploy.

# Requirements

- Minimal knowledge of Terraform and AWS. 
- Prepare some kind of authorization to AWS provider. 
- Any Terraform from TF 0.12.26 up to 1.0.4
- AWS provider from `3.47` to `3.53`
- Any AWS region that has AWS RDS 
- Clone the code

### Reproduction step 1: Run first apply to create the main database

From the clone code repo, provided that you've prepared AWS credentials execute : 

```
terraform apply --auto-approve --target=aws_db_instance.main
```

It should end with something like this : 

```
...
aws_db_instance.main: Still creating... [17m0s elapsed]
aws_db_instance.main: Creation complete after 17m6s [id=terraform-20210809130010194600000001]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

E.g. now we have a primary DB instance created. 


### Reproduction step 2: Run second apply in an attempt to create a replica

**Hypothesis** : With the both parameters defined : `parameter_group_name`  and `ca_cert_identifier` it should fail.

We have the replica defined for this test as follows : 

```
## STEP 2 - Add read replica
resource "aws_db_instance" "read" {

  engine               = "oracle-ee"
  engine_version       = "12.1.0.2.v10"
  instance_class       = "db.m4.large"
  name                 = "READ"
  username             = "oadmin"
  identifier           = "test-rds-read-0"
  skip_final_snapshot  = true
  apply_immediately    = true

  allocated_storage   = 50
  replicate_source_db = aws_db_instance.main.id

  # Combination of "parameter_group_name" + "ca_cert_identifier" 
  # makes it fail 
  parameter_group_name = "default.oracle-ee-12.1"
  ca_cert_identifier = "rds-ca-2019"

  timeouts {
    update = "120m"
  }

}
```

Now let's try to make apply, to create a second resource :


```
terraform apply --auto-approve
```

It will fail with the following error : 

```
...
Error: error rebooting DB Instance (test-rds-read-0): InvalidDBInstanceState: Instance cannot currently reboot due to an in-progress management operation.
    status code: 400, request id: 861d2ccf-ab99-418c-9365-a8b188b9301f

  on main.tf line 60, in resource "aws_db_instance" "read":
  60: resource "aws_db_instance" "read" {
```

And if we change just one line as follows in the definition of the read replica, by commenting it out : 

```
...
  # Combination of "parameter_group_name" + "ca_cert_identifier" 
  # makes it fail 
  # parameter_group_name = "default.oracle-ee-12.1"
  ca_cert_identifier = "rds-ca-2019"

  timeouts {
    update = "120m"
  }
```


The apply will be successful : 

```
terraform apply --auto-approve
random_password.db_master_pwd: Refreshing state... [id=none]
aws_db_instance.main: Refreshing state... [id=terraform-20210812081218002000000001]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # aws_db_instance.main has been changed
  ~ resource "aws_db_instance" "main" {
      + enabled_cloudwatch_logs_exports       = []
        id                                    = "terraform-20210812081218002000000001"
      ~ latest_restorable_time                = "0001-01-01T00:00:00Z" -> "2021-08-12T08:30:19Z"
        name                                  = "MAINDB"
      + security_group_names                  = []
      + tags                                  = {}
        # (52 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using
ignore_changes, the following plan may include actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # aws_db_instance.read will be created
  + resource "aws_db_instance" "read" {
      + address                               = (known after apply)
      + allocated_storage                     = 50
      + apply_immediately                     = true
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
...
aws_db_instance.read: Still creating... [14m10s elapsed]
aws_db_instance.read: Still creating... [14m20s elapsed]
aws_db_instance.read: Still creating... [14m30s elapsed]
aws_db_instance.read: Creation complete after 14m37s [id=test-rds-read-0]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```


# Results

If the AWS RDS read replica defined with both `parameter_group_name` and `ca_cert_identifier` its deployment will fail. 


