# Create custom Language List with desired Language Input configurations.
$1 = New-WinUserLanguageList en-US
$1.Add('ko')
Set-WinUserLanguageList $1