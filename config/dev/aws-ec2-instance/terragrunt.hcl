# Automatically find the root terragrunt.hcl and inherit its
# configuration
include "root" {
  path = find_in_parent_folders()
}

# Include the envcommon configuration for the component. The envcommon configuration contains settings that are common
# for the component across all environments.
include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/${basename(get_terragrunt_dir())}.hcl"
}

# ---------------------------------------------------------------------------------------------------------------------
# Override parameters for this environment
# ---------------------------------------------------------------------------------------------------------------------

# These inputs get merged with the common inputs from the root and the envcommon terragrunt.hcl
inputs = {
  instance_type = "t3.micro"
}
