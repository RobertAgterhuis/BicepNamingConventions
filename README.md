# Azure Resources Naming Conventions and Tagging with Bicep and Azure DevOps
## Introduction
Example Repository for creating a Resource Group within Azure for storing a template spec which can be loaded into the main.bicep for a uniform naming convention an tagging strategy. After creation a Lock will be set an RBAC will be applied. 
Although there are several methods to achieve a naming convention within Azure, i decided to publish my approach to Github. Use it to your benifit. If you have any recommendations or remarks about my method please feel free to drop me a line

## Requirements
- Basic knowledge of Azure DevOps and Bicep (Tip visit Microsoft Learn for learning and covering the basics of Bicep)
- Azure DevOps account
- 4 Service Connections within your Project
  - AzureDEV
  - AzureTST
  - AzureACC
  - AzurePRD
- Visual Studio Code
- Visual Studio Code Bicep Extension
- A Tagging strategy within your organisation, for my convenience i used some recommendations from ISO27001
- 3 Azure AD Groups for applying RBAC (in the future i would like to achieve this trough a deployment script)
  - role-resourcegroupName-Readers
  - role-resourcegroupName-Contributors
  - role-resourcegroupName-Administrators
  

## Repo structure
### Root
#### bicepconfig.json
Within the bicepconfig.json file there is an alias section created for the location of the template-spec: convention-names. This template-spec will be loaded in the main.bicep for the uniform naming convention. For more information about the possile settings in this file see: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-config
Change the values within the following section to represent the resource group in which the convention-names template spec will be placed, also change the subscription to your own:
```
 "ts": {
          "NamesSpecs": {
            "subscription": "subscriptionID",
            "resourceGroup": "YOUR RESOURCE GROUP"
          },
        }

```

#### main.bicep
This is where the magic happpens from a Bicep perspective this main.bicep file is called from the main.yml file which resides in the folder: Pipelines. In the main.bicep there is a mandatory section. Do not change or delete this section. If you do, your pipeline Deploy step will fail.
For demonstration purposes only the following resources will be created:
- A Resource Group (name is depending on your input in the start-pipeline.yml)
- A template-spec within the resource group called: **convention-names**
- A StorageAccount with the naming convention configured in the template-spec

### Pipelines
#### start-pipeline.yml
This is the pipeline which will be configured to run within Azure DevOps. The start-pipeline.yml is in it self fully documented so further explanation is not nessecary in my opinion. This start-pipeline.yml is not much more then a parameter file which calls other yaml files for the actual execution of the pipeline.

#### main.yml
In the main.yml file there is a mandatary parameter section which must not be edited or deleted. If you do your pipeline will fail. This is because the parameters are expected in the start-pipeline.yml and they are also declared as a param in the main.bicep file

#### names-templatesspec.yml
This yaml file takes the resources.names.bicep file and converts is to a the template-spec which will be placed in the resource group you've created with the main.yml. Also in this file there is a mandatory parameter section which can not be deleted. A part of this parameters is used for applying tagging to the resource.

### Modules
In this folder i place my bicep resource files which will be called as a module from the main.bicep file. For demontration purpose there are only the following files: 
- storage.Account.bicep
- rbac.lock.bicep

#### storage.Account.bicep
There are some mandatory settings in this file. These settings are nessecary to achieve the naming convention and tagging strategy. So again do not delete or change these values unless you are know what you're doing.
```
targetScope = 'resourceGroup' // Default, but because there are also other target scopes i want to be sure
param Location string = resourceGroup().location // Deploy the storage account to the same region as your Resource Group
param tagValues object // contructed from your input in the start-pipeline.yml
param storageAccountName string // contructed from your input in the start-pipeline.yml and the template-spec: convention-names

// Params for Storage Configuration Set which will be applied in resources.bicep under StorageModule
param storageSKU object // Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
param storageKind string //  Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
param storageMinimumTlsVersion string //  Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
param storagesupportsHttpsTrafficOnly bool //  Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
param storageNetworkAclAllow string //  Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
param storageNetworkAclBypass string //  Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
param blobRestore bool //  Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
param blobContainerDeleteRetentionPolicy bool //  Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
param blobDeleteRetentionPolicy bool //  Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
param fileServicesRetention bool //  Depending on Environment (AzureDEV, AzureTS, AzureACC or AzurePRD), configuration is contructed from storage-config template spec
```


