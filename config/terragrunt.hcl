locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  environment_name  = local.environment_vars.locals.environment
  home_region       = local.environment_vars.locals.home_region
  state_bucket_name = "burner-ci-demo-tf-state-${local.environment_name}-973606771572"
}

remote_state {
  backend = "s3"

  config = {
    bucket         = local.state_bucket_name
    region         = local.home_region
    key            = "${local.environment_name}/${path_relative_to_include()}/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "burner-ci-demo-terraform-locking-${local.environment_name}"
  }

  generate = {
    path      = "_tg_backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

inputs = {
  environment_name = local.environment_name
}
