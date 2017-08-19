#
# Windows PowerShell script for AD DS Deployment
#

Param(
   [Parameter(Mandatory=$True)]
   [string]$DomainName,
	
   [Parameter(Mandatory=$True)]
   [string]$DomainNetbiosName,
   
   [Parameter(Mandatory=$True)]
   [SecureString]$SafeModeAdministratorPassword
)


Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "Win2012R2" `
-DomainName $DomainName `
-DomainNetbiosName $DomainNetbiosName `
-ForestMode "Win2012R2" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true
-SafeModeAdministratorPassword ($SafeModeAdministratorPassword)
