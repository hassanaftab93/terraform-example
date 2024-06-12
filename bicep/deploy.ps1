[CmdletBinding()]
param(
    $basePath,
    $environment,
    $resourceGroupName
)

az deployment group create --resource-group "$resourceGroupName" --template-file "$basePath/bicep/init.bicep" --parameters "$basePath/bicep/params/$environment.bicepparam"