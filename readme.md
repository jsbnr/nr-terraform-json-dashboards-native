# New Relic Terraform Dashboards fomr JSON Templates
This example shows how you can use the newrelic_dashboards_json resource to provision dashboards. It includes an example for composing a dashboard from configuration, making it easy to build complex dashboards with ease.


## Installation
Make sure terraform is installed. I recommend [tfenv](https://github.com/tfutils/tfenv) for managing your terraform binaries.

Update the `runtf.sh.sample` file with your credentials and accont details and rename it `runtf.sh`. **Important do not commit this new file to git!** (It should be ignored in `.gitignore` already)

Note: You may want to update the version numbers in [main.tf](main.tf) to the latest versions of  Terraform and the New Relic provider.

## Initialisation
Use the `runtf.sh` helper script where ever you would normally run `terraform`. It simply wraps the terraform with some environment variables that make it easier to switch between projects. (You dont have to do it this way, you could just set the env vars and run terraform normally)

First initialise terraform:
```
./runtf.sh init
```

Now apply the changes:
```
./runtf.sh apply
```

## State storage
This example does not include remote state storage. State will be stored locally.

