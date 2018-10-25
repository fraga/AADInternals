﻿# Add some assemblies
Add-type -AssemblyName System.xml.linq
Add-Type -AssemblyName System.Runtime.Serialization
Add-Type -AssemblyName System.Windows.Forms 
Add-Type -AssemblyName System.Web
Add-Type -AssemblyName System.Web.Extensions

# Load the .ps1 scripts
$scripts = @(Get-ChildItem -Path $PSScriptRoot\*.ps1 -ErrorAction SilentlyContinue)

foreach ($script in $scripts) {
    try {
        Write-Verbose "Importing $($import.FullName)"
        . $script.FullName
    } catch {
        Write-Error "Failed to import $($script.FullName): $_"
    }
}

# Export functions
$functions=@(
    # Export-ADFSSigningCertificate.ps1
    "Export-ADFSSigningCertificate"

    # AccessToken_utils.ps1
    "Get-LoginInformation"
    "Get-AccessTokenForAADGraph"
    "Get-AccessTokenForMSGraph"
    "Get-AccessTokenForPTA"
    "Get-TenantDetails"
    "Read-AccessToken"
    "Get-EndpointInstances"
    "Get-EndpointIps"

    # ProvisioningAPI.ps1
    "Set-DomainAuthentication"
    "Get-CompanyInformation"
    "Get-SPOServiceInformation"
    "Get-ServiceLocations"
    "Get-CompanyTags"
    "Get-ServicePlans"
    "Get-Subscriptions"
    "Get-Users"
    "Get-User"
    "Remove-User"
    "New-User" # TODO: remove unused parameters
    "Set-User" # TODO: remove unused parameters
    "Get-GlobalAdmins"

    #FederatedIdentityTools.ps1
    "Get-Certificate"
    "Create-SAMLToken"
    "Get-ImmutableID"
    "ConvertTo-Backdoor"
    "Open-Office365Portal"

    # AzureADConnectAPI.ps1
    "Get-SyncConfiguration"
    "Set-AzureADObject"
    "Remove-AzureADObject"
    "Get-SyncObjects"
    "Set-UserPassword"
    "Reset-ServiceAccount"
    "Set-PassThroughAuthentication"

    # AzureManagementAPI_utils.ps1
    "Get-AuthTokenForAADIAMAPI"

    # AzureManagementAPI.ps1
    "New-GuestInvitation"
)
foreach($function in $functions)
{
    Export-ModuleMember -Function $function
}