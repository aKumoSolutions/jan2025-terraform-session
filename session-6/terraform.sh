#!/bin/bash

rm -rf .terraform*

$echo ENV
sed -i "s/_env_/$ENV/g" backend.tf

echo "Envrinemnt is set to $ENV

terraform init
terraform apply -var-file=$ENV.tfvars

echo "Rolling back to static string"
sed -i "s/$ENV/_env_/g" backend.tf

echo "Infra was deployed successfully to $ENV environment"
