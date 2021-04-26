
## Terraform

Terraform is controlled via a very easy to use command-line interface (CLI). Terraform is only a single command-line application: terraform. This application then takes a subcommand such as "apply" or "plan". The complete list of subcommands is in the navigation to the left.

The terraform CLI is a well-behaved command line application. In erroneous cases, a non-zero exit status will be returned. It also responds to -h and --help as you'd most likely expect.

## Pre-Requirements

- Download Terraform at https://www.terraform.io/downloads.html

or

```
wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
sudo unzip terraform_0.13.5_linux_amd64.zip 
sudo mv terraform /usr/local/bin
```

## AWS Profile

1) Create an AWS cli profile named terraform for test purpose
```
aws configure --profile=terraform
```

## Common commands
- apply: Builds or changes infrastructure
- console: Interactive console for Terraform interpolations
- destroy: Destroy Terraform-managed infrastructure
- env: Workspace management
- fmt: Rewrites config files to canonical format
- get: Download and install modules for the configuration
- graph: Create a visual graph of Terraform resources
- import: Import existing infrastructure into Terraform
- init: Initialize a Terraform working directory
- output: Read an output from a state file
- plan: Generate and show an execution plan
- providers: Prints a tree of the providers used in the configuration
- refresh: Update local state file against real resources
- show: Inspect Terraform state or plan
- taint: Manually mark a resource for recreation
- untaint: Manually unmark a resource as tainted
- validate: Validates the Terraform files
- version: Prints the Terraform version
- workspace: Workspace management

## Other commands
- 0.12upgrade: Rewrites pre-0.12 module source code for v0.12
- debug: Debug output management (experimental)
- force-unlock: Manually unlock the terraform state
- push: Obsolete command for Terraform Enterprise legacy (v1)
- state: Advanced state management


### References

- https://github.com/terraform-providers/terraform-provider-aws

