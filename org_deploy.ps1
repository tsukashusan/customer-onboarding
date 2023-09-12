set-variable -name TENANT_ID "<TENANT_ID>" -option constant
set-variable -name SUBSCRIPTOIN_GUID "<SUBSCRIPTOIN_GUID>" -option constant

$BICEP_FILE = "main3.bicep"
#$BICEP_FILE = "main.json"
$parameterFile = "azuredeploy.parameters.dev.json"
$location = "Japan East"

Connect-AzAccount -Tenant ${TENANT_ID} -Subscription ${SUBSCRIPTOIN_GUID}

New-AzDeployment `
  -TemplateFile $BICEP_FILE `
  -TemplateParameterFile ${parameterFile} `
  -Location $location `
  -Verbose
