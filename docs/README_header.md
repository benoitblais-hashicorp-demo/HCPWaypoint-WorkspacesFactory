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
* Set the `TFE_TOKEN` environment variable. The provider can read the TFE_TOKEN environment variable and the token stored there
to authenticate.

### HCP Authentication

The HCP provider requires a `Client ID` and a `Client Secret` from a service principal key in order to manage resources.

There are several ways to provide the required informations:

* Set the `client_id` and `client_secret` argument in the provider configuration. Use input variables.
* Set the `HCP_CLIENT_ID` and `HCP_CLIENT_SECRET` environment variables.

## Features

* HCP Waypoint Template
* HCP Waypoint Add-on
