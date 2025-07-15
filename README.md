# terraform-serverless-appp


-  API Gateway receives HTTP requests  
- Lambda Functions handle logic and interact with DynamoDB  
- DynamoDB stores backend data  

 Terraform Modules

The project is split into reusable modules under `/modules/`, each responsible for one AWS component:

| Module        | Description |
|---------------|-------------|
| `dynamodb`    | Creates a DynamoDB table with a configurable partition key |
| `iam`         | Creates IAM role and policy for Lambda with least-privilege permissions |
| `lambda`      | Deploys one or more Lambda functions (code must be zipped) |
| `api_gateway` | Creates REST API with methods and integrates with Lambda |

Each module exposes outputs (e.g. table name, Lambda ARNs, API URL) to be reused in `main.tf`.

Note About Lambda Code
This repo does not include zipped Lambda code for the functions.
To deploy the Lambda functions successfully:
Write your Lambda handler (index.js or lambda_function.py)
Create a .zip archive (e.g. zip my-lambda.zip index.js)
Place it under lambda-code/ and reference its path in variables:

 Deployment Steps

```bash
# Step 1: Go to dev environment
cd envs/dev/

# Step 2: Initialize Terraform
terraform init

# Step 3: Apply infrastructure
terraform apply
