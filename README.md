# terraform-aws

Let's figure out from scratch how to do 'git-ops' to an AWS environment. This needs to include: 

1. Setting up environment variables held as secrets in Git
2. Running Terraform plan
3. Running Terraform apply
4. Setting up a shared S3 backend to hold terraform state
5. Deploying something like a serverless rust function
6. Running terraform destroy

## todo:

Since this is being used as a 'test' project for another one elsewhere what's still needed is:

* port to gitlab
* aws integration
* aws claude setup
* put results in sharepoint or some other accessible place

## Bring up steps

There needs to be several rounds of 'terraform apply' for this to get to a working state because of the chicken/egg issue as clearly terraform state can't be stored remotely until there's an s3 bucket to put it into. 

Then you need an s3 bucket for the Lambda files to be stored in so that's another apply step that needs doing before the Lambda part is added, alongside a pipeline to upload the Rust binary as a zip. 

Additionally this needs building for the correct target.

1. Add secrets to github/lab
2. create S3 bucket for backend
3. update provider backend block
4. create s3 bucket for lambda
5. update lambda resources to include s3 bucket

