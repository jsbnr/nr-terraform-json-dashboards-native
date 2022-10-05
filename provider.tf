# terraform config 
terraform {
  required_version = "~> 1.3.1"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.4.2, <4.0.0"
    }
  }
}

provider "newrelic" {
  region = "US" 
}

variable "accountId" { type = string }
