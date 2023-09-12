param mspAssignmentName string
param registrationDefinitionId string


//var template = '{"$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#","contentVersion": "1.0.0.0","parameters": {},"resources": [    {        "type": "Microsoft.ManagedServices/registrationAssignments",        "apiVersion": "2020-02-01-preview",        "name": "${mspAssignmentName}",        "properties": {            "registrationDefinitionId": "[resourceId(\'Microsoft.ManagedServices/registrationDefinitions/\', ${mspRegistrationName})]"        }    }]}'
//resource deployassing 'Microsoft.Resources/deployments@2021-04-01' = {
//  name: 'rgAssignment'
//  properties: {
//    mode: 'Incremental'
//    template: any(template)
//  }
//}

resource deployassing 'Microsoft.ManagedServices/registrationAssignments@2022-10-01' = {
  name: mspAssignmentName
  properties: {
    registrationDefinitionId: registrationDefinitionId
  }
}
