/*
  SYNOPSIS: 
    Module for creating a Resource Group within Azure following the Governance

  DESCRIPTION:
    This main.bicep file creates a Resource Group within Azure and the resources within this group. 
    DO NOT CHANGE THE MANDATORY SECTION
    Everything will be handeled from the start-pipeline.yml
    Add the following yaml code to your start-pipeline.yaml to create the resource group with the declared resources
   # Example: Deploy Resources to the development environment
    # In this case a StorageAccount will be deployed after the completed pipeline look at the different configuration in DEV and PRD
    - template: main.yml
      parameters:
      # serviceConnetionName allowed values: AzureDEV, AzureTST, AzureACC, AzurePRD
      serviceConnectionName: AzureDEV
      # environmentType allowed values: AzureDEV, AzureTST, AzureACC, AzurePRD
      environmentType: AzureDEV
      # location allowed values: westeurope 
      location: westeurope
      # rgPrefix allowed value: rg
      rgPrefix: rg
      # Department allowed values: departmentX,,departmentY, departmentZ
      Department: departmentX
      # Change the workload to your requirements this is the actual name of the service/product
      workload: demo
      # Fill in your name
      createdBy: R.Agterhuis
      # costCenter allowed values:  costCenterX, costCenterY, costCenterZ
      costCenter: costCenterX
      # OpsTeam: Technical responsible team
      OpsTeam: DEVOPS
      # Which data type
      dataClassification: CodeBase
      FuncTeam: Baan
    
      

  VERSION: 
    1.0.0

  OWNER TEAM: 
    TLN-DEVOPS
*/

//----------------- BEGIN MANDATORY SETTINGS - DO NOT CHANGE ------------------------------\\
targetScope = 'subscription'

/*PARAMS SECTION: */
@description('The prefix of the resource group, used for naming convention, and VAR: ResourceGroupName')
@allowed([
  'rg'
])
param rgPrefix string
@description('Used for tagging this is a yaml pipeline parameter')
param createdBy string
@description('Used for tagging this is a yaml pipeline parameter')
@allowed([
  'Studers'
  'StudyStore'
  'vanDijk'
  'StudieShop'
  'TLN'
])
param costCenter string
@description('Used for tagging this is a yaml pipeline parameter')
param OpsTeam string
param FuncTeam string
@description('Used for tagging. This is a yaml pipeline parameter')
param currentDate string = utcNow('yyyy-MM-dd')
@description('Only West Europe is allowed. This is a yaml pipeline parameter')
@allowed([
  'westeurope'
])
param location string
@description('The EnvironmentType: AzureDEV, AzureTST, AzureACC or AzurePRD. This is a yaml pipeline parameter')
@allowed([
  'AzureDEV'
  'AzureTST'
  'AzureACC'
  'AzurePRD'
])
param EnvironmentType string
@description('Change the BusinessUnit to a descriptive name for the configuration')
@allowed([
  'finance'
  'hr'
  'sales'
  'customer-support'
  'itsupport'
  'itops'
  'itdev'
  'itdevops'
  'operations'
  'bi'
])
param Department string
@description('Business Critical of the configuration, used for tagging, this is a yaml pipeline parameter')
@allowed([
  'None-Not-Necessary'
  'Low-Necessary'
  'Medium-Important'
  'High-Essential'
])
param BusinessAvailibility string
@description('Confidentialy Tag Value, this is a yaml pipeline parameter')
@allowed([
  'None-Public'
  'Low-BusinessConfidential'
  'Medium-Confidential'
  'High-Secret'
])
param BusinessConfidentiality string
@description('Integrity')
@allowed([
  'None-Unprotected'
  'Low-Protected'
  'Medium-High'
  'High-Absolute'
])
param BusinessIntegrity string 
@description('name of Product')
param workload string

/* VAR SECTION: */
@description('Only the last 3 letters are needed for naming convention.')
var EnvironmentTypeLetter = substring(EnvironmentType,5,3)
@description('Construction of the BusinessUnit')
var BusinessUnit = '${costCenter}-${Department}'
@description('TagValues for the resources, these are defined as yaml pipeline parameters')
var tagValues = {
  CreatedBy: createdBy
  deploymentDate: currentDate
  OpsTeam: OpsTeam
  FuncTeam: FuncTeam
  CostCenter: costCenter
  BusinessUnit: BusinessUnit
  Environment: EnvironmentType
  Avilability: BusinessAvailibility
  Confidential: BusinessConfidentiality
  Integrity: BusinessIntegrity 
}
@description('Constructing the Resource Group name following the Mandatory Naming Convention')
var resourceGroupName = toLower('${rgPrefix}-${BusinessUnit}-${workload}-${EnvironmentTypeLetter}')

/* LOADING MANDATORY RESOURCES GROUP AND MODULES*/

@description('Loading of the Naming Convention Module from Template Spec. Always include this Module')
module namesModule 'ts/NamesSpecs:convention-names:v1.0' = {
  name: 'NamingConvention'
  scope: subscription()
  params: {
    EnvironmentType: EnvironmentType
    workload: workload
    BusinessUnit: BusinessUnit
    BusinessAvailibility: BusinessAvailibility
    BusinessConfidentiality: BusinessConfidentiality
    BusinessIntegrity: BusinessAvailibility
    createdBy: createdBy
    costCenter: costCenter
    FuncTeam: FuncTeam
    OpsTeam: OpsTeam
  }
}

// Loading of Configuration Set Module from Template Spec. Alway include this Module
module resourcesConfigModule 'ts/ConfigSpecs:resources-config:v1.0' = {
  name: 'resourcesConfigModule'
  scope: subscription()
}



//---------------------- END MANDATORY SETTINGS ------------------------------\\

// START: CREATING RESOURCE GROUP
resource rgResource 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
  tags: tagValues
}
// END: CREATION RESOURCE GROUP


// START CREATING RESOURCES WITHIN RESOURCE GROUP

module storageModule 'Modules/storage.account.bicep' = {
   name: 'storageDeployment'
   scope: resourceGroup(resourceGroupName)
   params: {
      tagValues: tagValues
      storageAccountName: replace(namesModule.outputs.names.STORAGE.storageAccountName, '-', '')
      storageKind: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.ST.kind
      storageSKU: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.ST.sku
      storageMinimumTlsVersion: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.ST.properties.minimumTlsVersion
      storagesupportsHttpsTrafficOnly: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.ST.properties.supportsHttpsTrafficOnly
      storageNetworkAclAllow: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.ST.properties.networkAcls.defaultAction
      storageNetworkAclBypass: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.ST.properties.networkAcls.bypass
      blobContainerDeleteRetentionPolicy: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.STBLOB.properties.containerDeleteRetentionPolicy.enabled
      blobDeleteRetentionPolicy: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.STBLOB.properties.deleteRetentionPolicy.enabled
      blobRestore: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.STBLOB.properties.restorePolicy.enabled
      fileServicesRetention: resourcesConfigModule.outputs.config[EnvironmentType].STORAGE.STFILE.properties.shareDeleteRetentionPolicy.enabled
   }
 }





module rbacLockModule 'Modules/rbac.lock.bicep' = {
   name: 'rbacLockDeployment'
   dependsOn: [
     storageModule
   ]
   scope: resourceGroup(resourceGroupName)
   params:{
     EnvironmentType: EnvironmentType
     LockLevel: resourcesConfigModule.outputs.config[EnvironmentType].MANDATORY.LockLevel
   }
 }
