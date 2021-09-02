

$PathforFiles = Read-Host "Please Enter Path"

Set-Location $PathforFiles
$AllItems = Get-ChildItem -File -Name

$StopWatch = new-object system.diagnostics.stopwatch
$StopWatch.Start()

foreach ($Item in $AllItems) {
    $ItemFolder = [IO.Path]::GetFileNameWithoutExtension($Item)
    
    $NewPath = Join-Path -Path "$PathforFiles" -ChildPath "$ItemFolder"
    New-Item -Path $NewPath -ItemType Directory
    
    Move-Item -Path ("$Pathforfiles" + "\" + "$Item") -Destination ("$NewPath")
    $Item
    $ItemFolder
    $NewPath
    Write-Output "$Item is complete"
}

$StopWatch.Stop()
$Minutes = $StopWatch.Elapsed.Minutes
$Seconds = $StopWatch.Elapsed.Seconds
$Mili = $StopWatch.Elapsed.Milliseconds
Write-Output "The process was completed in $Minutes Minutes and $Seconds Seconds ($Mili ms)"