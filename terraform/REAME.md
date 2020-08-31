
## Terraform

Download Terraform at https://www.terraform.io/downloads.html

aws configure --profile=terraform

1) Update the public key location at terraform.tfvars

2) If you are executing the script by the first time, yoy may execute the following command:
```
cd two-tier
terraform init 
```

3) After init terraform folder, you may check which changes will be made on your AWS infrastruture
``` 
terraform plan -var 'key_name=terraform' -var 'public_key_path=~/.ssh/terraform.pub'
```

``` 
terraform apply
```



### References

- https://github.com/terraform-providers/terraform-provider-aws

