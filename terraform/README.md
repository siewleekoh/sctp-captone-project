## Local development

- To set up your local environment, rename `secrets.tfvars.example` to `secrets.tfvars` with updated aws secrets. 
- `secrets.tfvars` is in `.gitignore` and will not be committed.

### Running terraform
- To start terraform

```
terraform init
```

- To check resources that are going to be created and for any errors

```
terraform plan -var-file="secrets.tfvars"
```

- To apply the changes

```
terraform apply -var-file="secrets.tfvars"
```


- To destroy the resources created

```
terraform destroy -var-file="secrets.tfvars"
```

### To access the EKS cluster
- To change EKS context for `kubectl` to the newly created cluster

```
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)