data "tfe_registry_module" "this" {
  organization    = var.organization
  name            = var.module_name
  module_provider = var.module_provider
}

data "tfe_project" "this" {
  name         = var.project_name
  organization = var.organization
}

resource "hcp_waypoint_template" "this" {
  name                            = var.name
  terraform_no_code_module_id     = data.tfe_registry_module.this.no_code_module_id
  terraform_no_code_module_source = data.tfe_registry_module.this.no_code_module_source
  terraform_project_id            = data.tfe_project.this.id
  summary                         = var.template_summary
  description                     = var.template_description
  labels                          = var.labels
  # readme_markdown_template        = fileexists(var.readme_path) ? file(var.readme_path) : null
  variable_options = var.variables

  lifecycle {
    ignore_changes = [readme_markdown_template]
  }
}

resource "hcp_waypoint_add_on_definition" "this" {
  name                            = var.name
  description                     = var.add_on_description
  summary                         = var.add_on_summary
  terraform_no_code_module_id     = data.tfe_registry_module.this.no_code_module_id
  terraform_no_code_module_source = data.tfe_registry_module.this.no_code_module_source
  terraform_project_id            = data.tfe_project.this.id
  labels                          = var.labels
  # readme_markdown_template        = fileexists(var.readme_path) ? file(var.readme_path) : null
  variable_options = var.variables

  lifecycle {
    ignore_changes = [readme_markdown_template, terraform_project_id, terraform_cloud_workspace_details]
    # There is a bug in HCP Waypoint where the terraform_project_id is always marked as `Use the same HCP Terraform project that the application is in`.
  }
}