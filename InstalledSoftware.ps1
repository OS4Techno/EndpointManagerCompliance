<# 

OS4 Techno, Services TI Inc.
January 2023

Purpose: Evaluate the compliance based on installed applications with EndPoint Manager (Intune)
Repository: https://github.com/OS4Techno/EndpointManagerCompliance

#>

$Settings = @{}
$FortiEMS = "{C1534669-99D4-459E-8A05-7CD9FE9CD5BB}"
$SentinelOne = "{1897C0AD-51C3-45CE-9C79-B7CF93DA8DE8}" 
$InstalledProduct = (get-wmiobject -class Win32_Product).IdentifyingNumber

If ($FortiEMS -in $InstalledProduct){$Settings.add("FortiEMS","Installed")} else {$Settings.add("FortiEMS","NotInstalled")}
If ($SentinelOne -in $InstalledProduct){$Settings.add("SentinelOne","Installed")} else {$Settings.add("SentinelOne","NotInstalled")}

#Return $setting to InstalledSoftware.JSON
return $Settings | ConvertTo-Json -Compress