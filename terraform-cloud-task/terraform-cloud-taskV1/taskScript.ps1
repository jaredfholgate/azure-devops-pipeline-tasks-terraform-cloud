[string]$TerraformUrl = Get-VstsInput -Name TerraformUrl
[string]$TerraformToken = Get-VstsInput -Name TerraformToken
[string]$Organization = Get-VstsInput -Name Organization
[string]$Workspac = Get-VstsInput -Name Workspace
[bool]$RunPlan = Get-VstsInput -Name RunPlan -AsBool
[bool]$RunPlanAndApply = Get-VstsInput -Name RunPlanAndApply -AsBool
[bool]$AutoApprove = Get-VstsInput -Name AutoApprove -AsBool

if ($TerraformUrl -eq $null -or $TerraformUrl -eq "")
{
    $TerraformUrl = "app.terrafrom.io"
}

if ($TerraformToken -eq $null -or $TerraformToken -eq "") 
{
    Write-VstsTaskError -Message "The Terraform Token must be supplied."
}

if (!(Get-Command terraform -errorAction SilentlyContinue))
{
    Write-VstsTaskError -Message "Cannot find the Terraform CLI, please ensure it is installed on the agent."
}


