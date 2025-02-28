#!/bin/bash

terraform init -backend-config="storage_account_name=$1" \
               -backend-config="access_key=$2" \
               -backend-config="container_name=tfstate" \
               -backend-config="key=terraform.tfstate"
