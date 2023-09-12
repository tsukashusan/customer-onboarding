param resourceId_Microsoft_ManagedServices_registrationDefinitions_variables_mspRegistrationName string
param variables_mspAssignmentName string /* TODO: fill in correct type */

resource variables_mspAssignment 'Microsoft.ManagedServices/registrationAssignments@2022-10-01' = {
  name: variables_mspAssignmentName
  properties: {
    registrationDefinitionId: resourceId_Microsoft_ManagedServices_registrationDefinitions_variables_mspRegistrationName
  }
}
