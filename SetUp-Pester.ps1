#Get Version 
$PSVersionTable

# Import tools
Import-Module PackageManagement 

#dispaly commands in PackageManagement 
get-command -Module PackageManagement 

#Shows The  Package in Repostory 
Find-Package Pester

#Install Pester

Install-Module Pester -Force

#Update-Module Pester
Update-Module Pester 


#Pester Test 
Describe 'Test Name'{
     It 'Has this condition'{
     'test for condition' | Should xxx
     }


}

#region

Should

Filenamae.xyz | Should Exist
Filenamae.xyz | Should Contain  'Some Text'
Condition ($X -gt 1) | Should be $True 

#endregion