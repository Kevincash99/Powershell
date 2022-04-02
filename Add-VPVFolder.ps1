<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2022 v5.8.201
	 Created on:   	3/26/2022 4:34 PM
	 Created by:   	kevin
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

function Add-VPVPath
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true,
				   Position = 0,
				   HelpMessage = 'Add VPV Folder')]
		[string]$path,
		[Parameter(Mandatory = $true,
				   Position = 1,
				   HelpMessage = 'Add VPV Folder Name ')]
		[string]$folder,
		[Parameter(Position = 2)]
		[boolean]$IsInstalled = $false
	)
	
	$CorrectPath = $false
	while ($CorrectPath -eq $false)
	{
		if (!($path -match '^[a-z]:\\(?:[^\\/:*?"<>|\r\n]+\\)*[^\\/:*?"<>|\r\n]*$'))
		{
			Write-Host " $path Not a valid path " -ForegroundColor Cyan
			$path = Read-Host -Prompt "enter a Valid path"
		}
		else
		{
			$CorrectPath = $true
		}
		
	}
	

	while ($IsInstalled -eq $false)
	{
		
		if (!(Test-Path $("$path\$folder")))
		{
			New-Item -Path $path -name $folder -ItemType "directory"
			$IsInstalled = $true
			Write-Host "Folder Built"
		}
		elseif (Test-Path $("$path\$folder"))
		{
			Write-Host "Folder Exist "
			$IsInstalled = $true
		}
		else { }
	}
	
}
  #test 

Add-VPVPath -path C:\test -folder test1

cls