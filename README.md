# GHE with TERRAFORM

Terraform Github Provider docs: https://registry.terraform.io/providers/integrations/github/latest/docs/

## Files

### Workflows

- [Workflow for the creation of an organization](.github/workflows/createorg.yml)
- [Workflow for the configuration of an organization (team, repository, permission, protection,...)](.github/workflows/configureorg.yml)


### Terraform
[Main File](main.tf)
#### Organization

 - [Create an organization](modules/create-organization)
 - [Add member to a organization](modules/add-organization-member)
 - [Create a runner group](modules/create-runner-group)

#### Repository


- [Create a repository](modules/create-repository)
- [Create a branch](modules/create-branch)
- [Create a file](modules/create-file)
- [Create a repository project](modules/create-repository-project)



#### Team

- [Create a team](modules/create-team)
- [Add a team to a repository](modules/add-team-repository-permissions)
- [Add member to a team](modules/add-team-member)

#### Rules

- [Add a repository ruleset](modules/add-repository-ruleset)
- [Add branch protection](modules/add-branch-protection)



## Guide

In this part I will go over how this terraform build can be run. It is expected that the Github Enteprise is already created and that you have the slug.


### Creating organizations
1. In this [file](data.tf),  change the 'slug' paramater into your enterprise's slug.
2. In this [file](main.tf), fill in the parameters of the 'create-organization' module.
3. On Github, go to your settings and make a PAT. This PAT should have enough permissions.
4. Copy the token and add it to your repository secrets (the repository where you are running the workflow from)
5. In this [file](.github/workflows/createorg.yml), on line 27 change 'ADMIN_TOKEN2' into the secret you made.
6. Push the changes and run the workflow manually on Github.

After the creation of an organization, we have to authorize the PAT we made earlier so it has access to the organization. If you don't do this, the next configuration steps will NOT work.

### Configuring organization

1. In this [file](main.tf), fill in the parameters of the modules u want to apply.
2. In this [file](.github/workflows/configureorg.yml), change 'ADMIN_TOKEN2' into the secret you made.
3. In the same file, change the env GITHUB_OWNER into the name of the organization you are working on.
4. At the "Terraform Apply" step, you are free to add the modules you want to run.
5. Push the changes and run the workflow manually on Github.



## Self-hosted runner on Azure


Did not work in a script because of OIDC issues with the login.
 

https://learn.microsoft.com/en-us/azure/container-apps/tutorial-ci-cd-runners-jobs?tabs=bash&pivots=container-apps-jobs-self-hosted-ci-cd-github-actions
https://docs.github.com/en/actions/hosting-your-own-runners/


1. az login  
2. az upgrade  
3. az extension add --name containerapp --upgrade
4. $env:SUBSCRIPTION="cc934d76-6d72-49cb-a908-81217ad4ae29"
5. $env:RESOURCE_GROUP="RG_Emre.Igten"  
6. $env:LOCATION="westeurope"  
7. $env:ENVIRONMENT="env-jobs-sample"  
8. $env:JOB_NAME="github-actions-runner-job"  
9. az containerapp env create --name $env:ENVIRONMENT --resource-group $env:RESOURCE_GROUP --location $env:LOCATION --subscription $env:SUBSCRIPTION
10.  $env:GITHUB_PAT = "..."
11.  $env:REPO_OWNER = "DLW-TEST-EMRE"
12.  $env:REPO_NAME = "ghe_terraform"
13. $env:CONTAINER_IMAGE_NAME = "github-actions-runner:1.0"
14. $env:CONTAINER_REGISTRY_NAME = "runnerregistry"
15. az acr create --name $env:CONTAINER_REGISTRY_NAME --resource-group $env:RESOURCE_GROUP --location $env:LOCATION --sku Basic --admin-enabled true --subscription $env:SUBSCRIPTION
16. az acr build --registry $env:CONTAINER_REGISTRY_NAME --image $env:CONTAINER_IMAGE_NAME --file "Dockerfile.github" "https://github.com/Azure-Samples/container-apps-ci-cd-runner-tutorial.git" --subscription $env:SUBSCRIPTION
17. az containerapp job create -n "terraform" -g $env:RESOURCE_GROUP --environment $env:ENVIRONMENT --subscription $env:SUBSCRIPTION  --trigger-type Event --replica-timeout 1800 --replica-retry-limit 0 --replica-completion-count 1 --parallelism 1 --image "$env:CONTAINER_REGISTRY_NAME.azurecr.io/$env:CONTAINER_IMAGE_NAME" --min-executions 0 --max-executions 10 --polling-interval 30 --scale-rule-name "github-runner" --scale-rule-type "github-runner" --scale-rule-metadata "githubAPIURL=https://api.github.com" "owner=$env:REPO_OWNER" "runnerScope=repo" "repos=$env:REPO_NAME" "targetWorkflowQueueLength=1" --scale-rule-auth "personalAccessToken=personal-access-token" --cpu "4.0" --memory "8Gi" --secrets "personal-access-token=$env:GITHUB_PAT" --env-vars "GITHUB_PAT=secretref:personal-access-token" "GH_URL=https://github.com/$env:REPO_OWNER/$env:REPO_NAME" "REGISTRATION_TOKEN_API_URL=https://api.github.com/repos/$env:REPO_OWNER/$env:REPO_NAME/actions/runners/registration-token" --registry-server "$env:CONTAINER_REGISTRY_NAME.azurecr.io"


If you have ran all these powershell commands you can change the runner in your workflow file to self-hosted. This will automatically use the runner you created.



18. az containerapp job execution list --name "terraform" --resource-group "$env:RESOURCE_GROUP" --output table --query '[].{Status: properties.status, Name: name, StartTime: properties.startTime}' --subscription $env:SUBSCRIPTION



## USE CASE 


Use Case: Setting Up a Development Environment  

Objective:  
The objective of this use case is to establish an automated workflow using Terraform for managing the development environment, including creating organizational structures, teams, repositories, and branch protections.  

Steps:  
  
Creating Organization:  
Utilizing Terraform, we create a new organization named "DLW-TEST-DEMO" on GitHub.  

Creating Teams:  
Within the organization, we establish three teams:  
"Developers": Responsible for actively developing features.  
"Testers": Responsible for testing the developed features.  
"Admins": Responsible for overall management of the development environment.  
  
Creating Repositories:  
We create two repositories within the organization:  
"appbuilding-backend": Repository for the backend code of the app.  
"appbuilding-frontend": Repository for the frontend code of the app.  
Both repositories must have projects and vulnerability alerts enabled and initialized.  
  
Creating Branches:  
We create master and development branches on both repositories.  

Assigning Teams to Repositories:  
We assign appropriate access rights to the repositories for each team. For example, "Developers" are granted write access to both repositories,   "Testers" are granted read access, and "Admins" are granted admin access.  
  
Setting Up Branch Protections:  
Branch protections are established for both repositories to safeguard the codebase. This includes setting up required commit signatures, requiring   conversation resolution for pull requests, and restricting push access to certain branches.  
  
Adding Organization Members  
(Only myself here)  

Adding Team Members:  
We add team members to the "Developers," "Testers," and "Admins" teams. (Only myself here)  
  
Adding Files:  
Create a README file in the development branch in both repositories.  

