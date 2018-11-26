$ssfFonts = 0x14
$fontSourceFolder = "C:\Users\c41670\Software\01 - FONTS\Fonts"
$Shell = New-Object -ComObject Shell.Application
$SystemFontsFolder = $Shell.Namespace($ssfFonts)
$FontFiles = Get-ChildItem $fontSourceFolder
$SystemFontsPath = $SystemFontsFolder.Self.Path
$rebootFlag = $false

foreach($FontFile in $FontFiles) {
	# $FontFile will be copied to this path:
	$targetPath = Join-Path $SystemFontsPath $FontFile.Name
	# So, see if target exists...
	if(Test-Path $targetPath){
		# font file with the same name already there.
		# delete and replace.
		$rebootFlag = $true
		Remove-Item $targetPath -Force
		Copy-Item $FontFile.FullName $targetPath -Force
	}else{
		#install the font.
		$SystemFontsFolder.CopyHere($FontFile.fullname)
	}
}

#Follow-up message
if($rebootFlag){
	Write-Host "At least one existing font overwritten. A reboot may be necessary."
}
