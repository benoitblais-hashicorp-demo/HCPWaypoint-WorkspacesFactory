# HCP Terraform Workspace Template

This HCP Waypoint template is use to provision a HCP Terraform Workspace.

## Overview

This template provisions a HCP Terraform Workspace using a HashiCorp Terraform no-code module. It is designed to help developers quickly deploy a HCP Terraform Workspace within the designated HCP project.

### Features
*   Create and manage workspace within your HCP Terraform organization.
*   Configure workspace settings.
*   Configure workspace run task.
*   Configure workspace variables.

## Usage

Instructions on how to use the template within the HCP Waypoint UI to create an application.

1.  Navigate to the **Templates** section in your HCP Waypoint dashboard.
2.  Select the **HCPTerraformWorkspace** template.
3.  Follow the prompts to configure the application.

## Configure settings
*   `Application name`: Must be unique. It can be up to 50 characters and can only include letters, numbers, dashes, and underscores. It must be the same name as the workspace name and finished with `-workspace`.

### Required Inputs
*   `name` (string): The name of the workspace.
*   `project_name` (string): The name of the HCP Terraform project where the workspace should be created.
*   `vcs_repo_identifier` (string): A reference to your VCS repository in the format '<vcs organization>/<repository>'.

## Provisioned Resources

An overview of the main resources that will be created when an application is generated from this template.

*   `HCP Terraform Workspace`: A HCP Terraform Workspace following enterprise best practices.
*   `HCP Terraform Workspace Settings`: Execution mode for the workspace.
*   `HCP Terraform Workspace Run Task`: Run tasks assignation to the workspace.
*   `HCP Terraform Workspace variable`: Variables configured at the workspace level.
