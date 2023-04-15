Param(
[AllowEmptyCollection()]
[string]$MainLayout = "en-US",
[array]$AdditionalLayouts
)

# Create custom Language List with desired Language Input configurations.
Write-Output "Generating WinUserLanguageListObject."
$LanguageList = New-WinUserLanguageList $MainLayout
foreach ($Layout in $AdditionalLayouts) {
  $LanguageList.Add($Layout)
}
Set-WinUserLanguageList $LanguageList