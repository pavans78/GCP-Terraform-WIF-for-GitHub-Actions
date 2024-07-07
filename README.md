
This repository provides an example of setting up Workload Identity Federation in Google Cloud using Terraform, demonstrating the creation of two resources: a `workload identity pool` and a `workload identity pool provider`.
 
# Google Cloud Workload Identity Federation:

Workload Identity Federation (WIF) in Google Cloud Platform (GCP) addresses the security challenges associated with managing access from external workloads to GCP resources. Traditionally, accessing GCP resources from outside environments required the use of long-lived service account keys, which posed security risks such as exposure to unauthorized access if not managed properly. WIF offers a more secure and manageable alternative by leveraging federated identities from external identity providers (IdPs).

## Repository Content

```
gcp-terraform-wif
├── README.md
├── _dev.tfvars
├── backend.tf
├── main.tf
├── sa.tf
├── var.tf
|__ wif.tf
```
**`backend.tf`** :

A backend.tf file in Terraform is used to specify the configuration details for Terraform's backend. The backend determines where and how Terraform stores state files, which are crucial for tracking the state of your infrastructure and managing changes over time. It may be local folder or remote backed (ex: s3, azurerm , gcs). In this repo , I used the GCS bucket as remote backend.

**`main.tf`** :

The main.tf file in Terraform typically contains required provider and provider setting to configure. 

**`wif.tf`** :

The wif.tf file is the resource file consists of the `workload identity pool` and a `workload identity pool provider` resource blocks for the gitHub provider

**`var.tf`**

A var.tf file in Terraform is typically used to declare and define input variables that are used throughout your Terraform configuration files (main.tf, backend.tf, etc.). These variables allow you to parameterize your infrastructure code, making it more flexible and reusable across different environments or configurations.

**`_dev.tfvars`** : 

A .tfvars file in Terraform is used to store variable values that can be easily referenced when running Terraform commands or executing Terraform scripts. 

#### Variables
Need to provide the values to the variables in the dev.tfvars file before run the terraform apply.

- `project_id` — GCP project id
- `pool_id` — GCP workload identity pool id
- `pool_display_name` — GCP workload identity pool name
- `pool_description` — GCP workload identity pool description
- `provider_id` — GCP workload identity pool provider id
- `provider_display_name` — GCP workload identity pool provider name
- `provider_description` — GCP workload identity pool provider description
- `attribute_condition` — Condition for workload identity pool provider
- `attribute_mapping` — Attribute mapping (GitHub and Google)
- `allowed_audiences` — Workload Identity Pool Provider allowed audiences
- `sa_mapping` — Service Account resource names and corresponding WIF provider attributes
- `service_account` — Provide a account id and display name for the Service account under service_account block.
- `repository_name` — Name consists of the user and repository name (ex: githubusername/repo-name)

## Try it out

Before initialize the terraform, we have to enable the following Google Cloud Service APIs in the project:

* `cloudresourcemanager.googleapis.com`
* `iam.googleapis.com`
* `iamcredentials.googleapis.com`



1. Initialize your new Terraform configuration by running the terraform init command in the same directory as your main.tf file:

    ```sh
    terraform init
    ```
1. format the files and See the execution plan by running the terraform plan command with var-file, var-file is the inputs of the variables:

    ```sh
    terraform fmt -check
    terraform plan -var-file=_dev.tfvars 
    ```
    The output has a + next to resources blocks , meaning that Terraform will create these resources. Beneath that, it shows the attributes that will be set. When the value displayed is (known after 
    apply), it means that the value won't be known until the resource is created.

    If anything in the plan seems incorrect, it is shows the error messages.

1. Apply you configuration now by running the command terraform apply:

    ```sh
    terraform apply plans.tfplan
    ```
    
----

