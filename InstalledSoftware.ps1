<# 

OS4 Techno, Services TI Inc.
January 2023

Purpose: Evaluate the compliance based on installed applications with EndPoint Manager (Intune)
Repository: https://github.com/OS4Techno/EndpointManagerCompliance

#>

$Settings = @{}
$DarktracecSensor = "{7CD79ADF-62DE-4ABA-8F91-CC2283187FE3}"
$TrendMicroApexOneSecurityAgent = "{1841AFE1-4BA7-44D4-8700-6ACF860A8ED1}"
$InstalledProduct = (get-wmiobject -class Win32_Product).IdentifyingNumber

If ($DarktracecSensor -in $InstalledProduct){$Settings.add("Darktrace","Installed")} else {$Settings.add("Darktrace","NotInstalled")}
If ($TrendMicroApexOneSecurityAgent -in $InstalledProduct){$Settings.add("TrendMicroApexOneSecurityAgent","Installed")} else {$Settings.add("TrendMicroApexOneSecurityAgent","NotInstalled")}

#Return $setting to InstalledSoftware.JSON
return $Settings | ConvertTo-Json -Compress