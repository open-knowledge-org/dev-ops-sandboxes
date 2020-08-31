
## Terraform - Two-Tier

1) If you are executing the script by the first time, you may execute the following command:
```
terraform init 
```

2) After init terraform folder, you may check which changes will be made on your AWS infrastruture
``` 
terraform plan
```

3) Format your configuration. Terraform will return the names of the files it formatted. In this case, your configuration file was already formatted correctly, so Terraform won't return any file names.
``` 
terraform fmt
```

4) Validate your configuration. If your configuration is valid, Terraform will return a success message.
```
terraform validate
```

3) Apply the changes on AWS 
``` 
terraform apply
```

## Terraform - After tests

- The `terraform destroy` command terminates resources defined in your Terraform configuration. This command is the reverse of terraform apply in that it terminates all the resources specified by the configuration. It does not destroy resources running elsewhere that are not described in the current configuration.

```
terraform destroy
```