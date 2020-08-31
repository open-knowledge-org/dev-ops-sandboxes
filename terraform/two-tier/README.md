
## Terraform - Two-Tier

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

4) Apply the changes on AWS 
``` 
terraform apply
```