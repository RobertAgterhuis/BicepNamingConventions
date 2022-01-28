
// Bicep Module for RBAC on Azure Resources
// This Module will be applied at the End of the Pipeline
targetScope = 'resourceGroup'

param LockLevel string // This parameter is retrieved from resources.config.bicep
param EnvironmentType  string // This parameter is retrieved from the Yaml pipeline
param LockUid string = uniqueString(EnvironmentType) // needed for creation of an Unique Lock name
@description('principalId of the Role Group that will be given Reader access to the resourceGroup')
param ReaderprincipalId string = 'AZUREAD GROUPID' // Role-RESOURCEGROUPNAME-Readers
@description('roleDefinition to apply to the resourceGroup - default is Reader')
param ReaderroleDefinitionId string = 'acdd72a7-3385-48ef-bd42-f606fba81ae7' // Guid of the Reader Role (Access control (IAM))
param ReaderUid string = newGuid()
@description('principalId of the Role Group that will be given Contribute access to the resourceGroup')
param ContributorPrincipalId string = 'AZUREAD GROUPID' // Role-RESOURCEGROUPNAME-Contributors
@description('roleDefinition to apply to the resourceGroup - Contributor')
param ContributorRoleDefinitionId string = 'b24988ac-6180-42a0-ab88-20f7382dd24c' // Guid of the Contributor Role (Access control (IAM))
param ContributorUid string = newGuid()
@description('principalId of the Role Group that will be given Owner access to the resourceGroup')
param OwnerPrincipalId string = 'AZUREAD GROUPID' // Role-RESOURCEGROUPNAME-Owners
@description('roleDefinition to apply to the resourceGroup - Owner')
param OwnerRoleDefinitionId string = '8e3af657-a8ff-443c-a75c-2fe8c4bcb635' // Guid of the Owner Role (Access control (IAM))
param OwnerUid string = newGuid()

var ReaderUS = uniqueString('${ReaderUid}-${EnvironmentType}')
@description('Unique name for the roleAssignment in the format of a guid')
var ReaderRoleAssignmentName = guid(ReaderUS)
var ContributorUS = uniqueString('${ContributorUid}-${EnvironmentType}')
@description('Unique name for the roleAssignment in the format of a guid')
var ContributorRoleAssignmentName  = guid(ContributorUS)
@description('Unique name for the roleAssignment in the format of a guid')
var OwnerRoleAssignmentName  = guid(OwnerUS)
var OwnerUS = uniqueString('${OwnerUid}-${EnvironmentType}')


// Reader Role Assignment
resource ReaderRoleAssignmentResource 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = if ((EnvironmentType == 'AzureACC') || (EnvironmentType == 'AzurePRD') )  {
  name: ReaderRoleAssignmentName
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', ReaderroleDefinitionId)
    principalId: ReaderprincipalId
  }
}

// Contributor Role Assignment
resource ContriburotRoleAssignmentResource 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = if ((EnvironmentType == 'AzureACC') || (EnvironmentType == 'AzurePRD') ) {
  name: ContributorRoleAssignmentName
  dependsOn: [
    ReaderRoleAssignmentResource
  ]
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', ContributorRoleDefinitionId)
    principalId: ContributorPrincipalId
  }
}

// Owner Role Assignment
resource OwnerRoleAssignmentResource 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = if ((EnvironmentType == 'AzureACC') || (EnvironmentType == 'AzurePRD') ) {
  name: OwnerRoleAssignmentName
  dependsOn: [
    ContriburotRoleAssignmentResource
  ]
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', OwnerRoleDefinitionId)
    principalId: OwnerPrincipalId
  }
}


// Mandatory Resource if Environment is Azure Production Lock will be applied.
resource Lock 'Microsoft.Authorization/locks@2016-09-01' = if ((EnvironmentType == 'AzureACC') || (EnvironmentType == 'AzurePRD') ) {
  name: '${LockUid}-${LockLevel}'
  dependsOn: [
    OwnerRoleAssignmentResource
  ]
  properties:{
    level: LockLevel
    notes: 'This is ${EnvironmentType} therefore this resource should not be deleted.'
  }
}
