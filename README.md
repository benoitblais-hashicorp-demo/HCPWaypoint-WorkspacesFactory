<!-- BEGIN_TF_DOCS -->
# HCP Waypoint Workspaces Factory

Code which manages configuration and life-cycle of the HCP Waypoint Workspaces Factory. It is designed to be used from a dedicated VCS-Driven Terraform workspace that would provision and manage the configuration using Terraform code (IaC).

## Permissions

### HCP Terraform Permissions

To manage resources, provide a user token from an account with appropriate permissions.
This user should have the `Manage Projects` and `Manage Workspaces` permission. Alternatively,
you can use a token from a team instead of a user token.

### HCP Permissions

To manage the resources from that code, provide a Client ID and a Client Secret from a service principal key with `admin` permissions.

## Authentication

### HCP Terraform Authentication

The HCP Terraform provider requires a HCP Terraform/Terraform Enterprise API token in
order to manage resources.

There are several ways to provide the required token:

* Set the `token` argument in the provider configuration. You can set the token argument in the provider configuration. Use an
input variable for the token.
* Set the `TFE_TOKEN` environment variable. The provider can read the TFE\_TOKEN environment variable and the token stored there
to authenticate.

### HCP Authentication

The HCP provider requires a `Client ID` and a `Client Secret` from a service principal key in order to manage resources.

There are several ways to provide the required informations:

* Set the `client_id` and `client_secret` argument in the provider configuration. Use input variables.
* Set the `HCP_CLIENT_ID` and `HCP_CLIENT_SECRET` environment variables.

## Features

* HCP Waypoint Template
* HCP Waypoint Add-on

## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.13.0)

- <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) (0.110.0)

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (~>0.70)

## Modules

No modules.

## Required Inputs

The following input variables are required:

### <a name="input_organization"></a> [organization](#input\_organization)

Description: (Required) Name of the organization.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_add_on_description"></a> [add\_on\_description](#input\_add\_on\_description)

Description: (Optional) A description of the Waypoint add-on, along with when and why it should be used, up to 500 characters.

Type: `string`

Default: `"This HCP Waypoint add-on provisions a HCP Terraform workspace. You must provide an application name (unique, up to 50 characters, letters/numbers/dashes/underscores, ends with -workspace), workspace name, project name, and a vcs repository identifier (comma-separated without spaces)."`

### <a name="input_add_on_summary"></a> [add\_on\_summary](#input\_add\_on\_summary)

Description: (Optional) A brief description of the Waypoint add-on, up to 64 characters.

Type: `string`

Default: `"This add-on provisions a HCP Terraform workspace."`

### <a name="input_labels"></a> [labels](#input\_labels)

Description: (Optional) Labels to assign to the Waypoint template and add-on.

Type: `list(string)`

Default:

```json
[
  "hcp terraform",
  "workspace"
]
```

### <a name="input_module_name"></a> [module\_name](#input\_module\_name)

Description: (Optional) Name of the module.

Type: `string`

Default: `"workspacesfactory"`

### <a name="input_module_provider"></a> [module\_provider](#input\_module\_provider)

Description: (Optional) Name of the module provider.

Type: `string`

Default: `"tfe"`

### <a name="input_name"></a> [name](#input\_name)

Description: (Optional) Name of the Waypoint template and add-on.

Type: `string`

Default: `"HCPTerraformWorkspace"`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: (Optional) Name of the Terraform Cloud/Enterprise project where the workspace created by the no-code is located.

Type: `string`

Default: `"Terraform Workspaces Factory"`

### <a name="input_template_description"></a> [template\_description](#input\_template\_description)

Description: (Optional) A description of the Waypoint template, along with when and why it should be used, up to 500 characters.

Type: `string`

Default: `"This HCP Waypoint template provisions a HCP Terraform workspace. You must provide an application name (unique, up to 50 characters, letters/numbers/dashes/underscores, ends with -workspace), workspace name, project name, and a vcs repository identifier (comma-separated without spaces)."`

### <a name="input_template_summary"></a> [template\_summary](#input\_template\_summary)

Description: (Optional) A brief description of the Waypoint template, up to 64 characters.

Type: `string`

Default: `"This template is use to provision a HCP Terraform workspace."`

### <a name="input_variables"></a> [variables](#input\_variables)

Description:   (Optional) The variables block is a list of object that supports the following:  
    name          : (Required) The name of the variable.  
    variable\_type : (Required) The type of the variable.  
    options       : (Optional) A list of options for the variable, if applicable.  
    user\_editable : (Optional) Whether the variable is editable by the user creating an application.

Type:

```hcl
list(object({
    name          = string
    variable_type = string
    options       = optional(list(string), null)
    user_editable = optional(bool, true)
  }))
```

Default:

```json
[
  {
    "name": "name",
    "variable_type": "string"
  },
  {
    "name": "project_name",
    "variable_type": "string"
  },
  {
    "name": "vcs_repo_identifier",
    "variable_type": "string"
  }
]
```

## Resources

The following resources are used by this module:

- [hcp_waypoint_add_on_definition.this](https://registry.terraform.io/providers/hashicorp/hcp/0.110.0/docs/resources/waypoint_add_on_definition) (resource)
- [hcp_waypoint_template.this](https://registry.terraform.io/providers/hashicorp/hcp/0.110.0/docs/resources/waypoint_template) (resource)
- [tfe_project.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/project) (data source)
- [tfe_registry_module.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/registry_module) (data source)

## Outputs

No outputs.

<!-- markdownlint-enable -->
<!-- END_TF_DOCS -->