terraform {
  source = "../../../modules//${basename(get_terragrunt_dir())}"
}

inputs = {
  aws_region = "ap-southeast-2"
  name       = "burner-ci-demo"
}
