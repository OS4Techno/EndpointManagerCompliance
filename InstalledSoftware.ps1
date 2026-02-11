<# 

OS4 Techno, Services TI Inc.
January 2023

Purpose: Evaluate the compliance based on installed applications with EndPoint Manager (Intune)
Repository: https://github.com/OS4Techno/EndpointManagerCompliance

#>

$Settings = @{}
$FortiEMS = "{}"
$SentinelOne = "{}" 
$InstalledProduct = (get-wmiobject -class Win32_Product).IdentifyingNumber

If ($FortiEMS -in $InstalledProduct){$Settings.add("FortiEMS","Installed")} else {$Settings.add("FortiEMS","NotInstalled")}
If ($SentinelOne -in $InstalledProduct){$Settings.add("SentinelOne","Installed")} else {$Settings.add("SentinelOne","NotInstalled")}

#Return $setting to InstalledSoftware.JSON
return $Settings | ConvertTo-Json -Compress