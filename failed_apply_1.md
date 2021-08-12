# Read replica adding, faield apply 1

```Terraform
terraform apply
random_password.db_master_pwd: Refreshing state... [id=none]
aws_db_instance.main: Refreshing state... [id=terraform-20210809130010194600000001]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
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
      + backup_retention_period               = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = "rds-ca-2019"
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_subnet_group_name                  = (known after apply)
      + delete_automated_backups              = true
      + endpoint                              = (known after apply)
      + engine                                = "oracle-ee"
      + engine_version                        = "12.1.0.2.v10"
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = "test-rds-read-0"
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.m4.large"
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + maintenance_window                    = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = (known after apply)
      + name                                  = "read"
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = "default.oracle-ee-12.1"
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replicas                              = (known after apply)
      + replicate_source_db                   = "terraform-20210809130010194600000001"
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = true
      + snapshot_identifier                   = (known after apply)
      + status                                = (known after apply)
      + storage_type                          = (known after apply)
      + tags_all                              = (known after apply)
      + timezone                              = (known after apply)
      + username                              = "oadmin"
      + vpc_security_group_ids                = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_db_instance.read: Creating...
aws_db_instance.read: Still creating... [10s elapsed]
aws_db_instance.read: Still creating... [20s elapsed]
aws_db_instance.read: Still creating... [30s elapsed]
aws_db_instance.read: Still creating... [40s elapsed]
aws_db_instance.read: Still creating... [50s elapsed]
aws_db_instance.read: Still creating... [1m0s elapsed]
aws_db_instance.read: Still creating... [1m10s elapsed]
aws_db_instance.read: Still creating... [1m20s elapsed]
aws_db_instance.read: Still creating... [1m30s elapsed]
aws_db_instance.read: Still creating... [1m40s elapsed]
aws_db_instance.read: Still creating... [1m50s elapsed]
aws_db_instance.read: Still creating... [2m0s elapsed]
aws_db_instance.read: Still creating... [2m10s elapsed]
aws_db_instance.read: Still creating... [2m20s elapsed]
aws_db_instance.read: Still creating... [2m30s elapsed]
aws_db_instance.read: Still creating... [2m40s elapsed]
aws_db_instance.read: Still creating... [2m50s elapsed]
aws_db_instance.read: Still creating... [3m0s elapsed]
aws_db_instance.read: Still creating... [3m10s elapsed]
aws_db_instance.read: Still creating... [3m20s elapsed]
aws_db_instance.read: Still creating... [3m30s elapsed]
aws_db_instance.read: Still creating... [3m40s elapsed]
aws_db_instance.read: Still creating... [3m50s elapsed]
aws_db_instance.read: Still creating... [4m0s elapsed]
aws_db_instance.read: Still creating... [4m10s elapsed]
aws_db_instance.read: Still creating... [4m20s elapsed]
aws_db_instance.read: Still creating... [4m30s elapsed]
aws_db_instance.read: Still creating... [4m40s elapsed]
aws_db_instance.read: Still creating... [4m50s elapsed]
aws_db_instance.read: Still creating... [5m0s elapsed]
aws_db_instance.read: Still creating... [5m10s elapsed]
aws_db_instance.read: Still creating... [5m20s elapsed]
aws_db_instance.read: Still creating... [5m30s elapsed]
aws_db_instance.read: Still creating... [5m40s elapsed]
aws_db_instance.read: Still creating... [5m50s elapsed]
aws_db_instance.read: Still creating... [6m0s elapsed]
aws_db_instance.read: Still creating... [6m10s elapsed]
aws_db_instance.read: Still creating... [6m20s elapsed]
aws_db_instance.read: Still creating... [6m30s elapsed]
aws_db_instance.read: Still creating... [6m40s elapsed]
aws_db_instance.read: Still creating... [6m50s elapsed]
aws_db_instance.read: Still creating... [7m0s elapsed]
aws_db_instance.read: Still creating... [7m10s elapsed]
aws_db_instance.read: Still creating... [7m20s elapsed]
aws_db_instance.read: Still creating... [7m30s elapsed]
aws_db_instance.read: Still creating... [7m40s elapsed]
aws_db_instance.read: Still creating... [7m50s elapsed]
aws_db_instance.read: Still creating... [8m0s elapsed]
aws_db_instance.read: Still creating... [8m10s elapsed]
aws_db_instance.read: Still creating... [8m20s elapsed]
aws_db_instance.read: Still creating... [8m30s elapsed]
aws_db_instance.read: Still creating... [8m40s elapsed]
aws_db_instance.read: Still creating... [8m50s elapsed]
aws_db_instance.read: Still creating... [9m0s elapsed]
aws_db_instance.read: Still creating... [9m10s elapsed]
aws_db_instance.read: Still creating... [9m20s elapsed]
aws_db_instance.read: Still creating... [9m30s elapsed]
aws_db_instance.read: Still creating... [9m40s elapsed]
aws_db_instance.read: Still creating... [9m50s elapsed]
aws_db_instance.read: Still creating... [10m0s elapsed]
aws_db_instance.read: Still creating... [10m10s elapsed]
aws_db_instance.read: Still creating... [10m20s elapsed]
aws_db_instance.read: Still creating... [10m30s elapsed]
aws_db_instance.read: Still creating... [10m40s elapsed]
aws_db_instance.read: Still creating... [10m50s elapsed]
aws_db_instance.read: Still creating... [11m0s elapsed]
aws_db_instance.read: Still creating... [11m10s elapsed]
aws_db_instance.read: Still creating... [11m20s elapsed]
aws_db_instance.read: Still creating... [11m30s elapsed]
aws_db_instance.read: Still creating... [11m40s elapsed]
aws_db_instance.read: Still creating... [11m50s elapsed]
aws_db_instance.read: Still creating... [12m0s elapsed]
aws_db_instance.read: Still creating... [12m10s elapsed]
aws_db_instance.read: Still creating... [12m20s elapsed]
aws_db_instance.read: Still creating... [12m30s elapsed]
aws_db_instance.read: Still creating... [12m40s elapsed]
aws_db_instance.read: Still creating... [12m50s elapsed]
aws_db_instance.read: Still creating... [13m0s elapsed]
aws_db_instance.read: Still creating... [13m10s elapsed]
aws_db_instance.read: Still creating... [13m20s elapsed]
aws_db_instance.read: Still creating... [13m30s elapsed]
aws_db_instance.read: Still creating... [13m40s elapsed]
aws_db_instance.read: Still creating... [13m50s elapsed]
aws_db_instance.read: Still creating... [14m0s elapsed]
aws_db_instance.read: Still creating... [14m10s elapsed]
aws_db_instance.read: Still creating... [14m20s elapsed]
aws_db_instance.read: Still creating... [14m30s elapsed]
aws_db_instance.read: Still creating... [14m40s elapsed]
aws_db_instance.read: Still creating... [14m50s elapsed]
aws_db_instance.read: Still creating... [15m0s elapsed]
aws_db_instance.read: Still creating... [15m10s elapsed]
aws_db_instance.read: Still creating... [15m20s elapsed]
aws_db_instance.read: Still creating... [15m30s elapsed]
aws_db_instance.read: Still creating... [15m40s elapsed]
aws_db_instance.read: Still creating... [15m50s elapsed]
aws_db_instance.read: Still creating... [16m0s elapsed]
aws_db_instance.read: Still creating... [16m10s elapsed]
aws_db_instance.read: Still creating... [16m20s elapsed]
aws_db_instance.read: Still creating... [16m30s elapsed]
aws_db_instance.read: Still creating... [16m40s elapsed]
aws_db_instance.read: Still creating... [16m50s elapsed]
aws_db_instance.read: Still creating... [17m0s elapsed]
aws_db_instance.read: Still creating... [17m10s elapsed]
aws_db_instance.read: Still creating... [17m20s elapsed]
aws_db_instance.read: Still creating... [17m30s elapsed]
aws_db_instance.read: Still creating... [17m40s elapsed]
aws_db_instance.read: Still creating... [17m50s elapsed]
aws_db_instance.read: Still creating... [18m0s elapsed]
aws_db_instance.read: Still creating... [18m10s elapsed]
aws_db_instance.read: Still creating... [18m20s elapsed]
aws_db_instance.read: Still creating... [18m30s elapsed]
aws_db_instance.read: Still creating... [18m40s elapsed]
aws_db_instance.read: Still creating... [18m50s elapsed]
aws_db_instance.read: Still creating... [19m0s elapsed]
aws_db_instance.read: Still creating... [19m10s elapsed]
aws_db_instance.read: Still creating... [19m20s elapsed]
aws_db_instance.read: Still creating... [19m30s elapsed]
aws_db_instance.read: Still creating... [19m40s elapsed]

Error: error rebooting DB Instance (test-rds-read-0): InvalidDBInstanceState: Instance cannot currently reboot due to an in-progress management operation.
	status code: 400, request id: 861d2ccf-ab99-418c-9365-a8b188b9301f

  on main.tf line 60, in resource "aws_db_instance" "read":
  60: resource "aws_db_instance" "read" {

```

