
## Terraform - Getting Started CF

1) If you are executing the script by the first time, you may execute the following command:
```
terraform init 
```

Output
```
Initializing the backend...

Initializing provider plugins...
- Finding cloudfoundry-community/cloudfoundry versions matching "0.12.6"...
- Installing cloudfoundry-community/cloudfoundry v0.12.6...
- Installed cloudfoundry-community/cloudfoundry v0.12.6 (self-signed, key ID 7D2C9F0DEADEE1C2)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/plugins/signing.html

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

2) Format your configuration. Terraform will return the names of the files it formatted. In this case, your configuration file was already formatted correctly, so Terraform won't return any file names.
``` 
terraform fmt
```

3) Validate your configuration. If your configuration is valid, Terraform will return a success message.
```
terraform validate
```

3) Apply the changes on CF 
``` 
terraform apply
```

### Documentation

https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs

## Terraform - After tests

- The `terraform destroy` command terminates resources defined in your Terraform configuration. This command is the reverse of terraform apply in that it terminates all the resources specified by the configuration. It does not destroy resources running elsewhere that are not described in the current configuration.

```
terraform destroy
```