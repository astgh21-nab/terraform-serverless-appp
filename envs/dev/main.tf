terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

#######3 ----- dynamodb module -----------#########
module "dynamodb" {
  source             = "../../modules/dynamodb"
  db_table_name      = "my_db_tb_name"
  partition_key      = "id"
  partition_key_type = "S"
}

###### --------- iam ------ #############

module "iam" {
  source = "../../modules/iam"

  role_name    = "dev_lambda_role"
  role_version = "2012-10-17"
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
  dynamodb_table_arn = module.dynamodb.table_arn
  allowed_actions = [
    "dynamodb:GetItem",
    "dynamodb:PutItem",
    "dynamodb:UpdateItem"
  ]
}
######### ------- lambda module ---- ############

module "lambda" {
  source = "../../modules/lambda"

  iam_role_arn = module.iam.role_arn

  lambdas = {
    my_lambda_1 = {
      function_name = "my-lambda-dev-1"
      handler       = "index.handler"
      runtime       = "nodejs18.x"
      filename      = "${path.module}/lambda-code/my-lambda-1.zip"
      environment_variables = {
        TABLE_NAME = "my-dynamodb-table"
        ENV        = "dev"
      }
    },
    my_lambda_2 = {
      function_name = "my-lambda-dev-2"
      handler       = "main.lambda_handler"
      runtime       = "python3.11"
      filename      = "${path.module}/lambda-code/my-lambda-2.zip"
      environment_variables = {
        TABLE_NAME = "my-dynamodb-table"
        ENV        = "dev"
      }
    }
  }

  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
}


###### -------------api_gateway module -------------#####################
module "api_gateway" {
  source = "../..//modules/api_gateway"

  aws_region           = "eu-central-1"
  lambda_function_name = "getUsersFunction"
  lambda_zip_path      = "lambda-code/my-lambda-1.zip"
  lambda_handler       = "index.handler"
  lambda_runtime       = "nodejs18.x"

  api_name          = "MyRestAPI"
  api_description   = "API for user operations"
  api_resource_path = "users"
  stage_name        = "prod"
}

output "api_invoke_url" {
  value = module.api_gateway.api_invoke_url
}
