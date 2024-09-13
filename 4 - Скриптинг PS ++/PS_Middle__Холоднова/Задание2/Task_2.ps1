$log = "$home\Desktop\Log.txt"
$pathtomonitor = "C:\Users\AAKholodnova\Documents\Pix\ПИР_Холоднова\4\PS_Middle__Холоднова\Задание2\тест"
$timeout = 1000
$pathFolder = "C:\Users\AAKholodnova\Documents\Pix\ПИР_Холоднова\4\PS_Middle__Холоднова\Задание2"

$FileSystemWatcher = New-Object System.IO.FileSystemWatcher $pathtomonitor
$FileSystemWatcher.IncludeSubdirectories = $true

while ($true) {
  $change = $FileSystemWatcher.WaitForChanged('All', $timeout)
  (Get-Date), $change.ChangeType.ToString(), $change.Name | Out-File $log -Append

  if (($change.TimedOut -eq $false) -and ($change.ChangeType.ToString() -eq "Created"))
  {
     $change.ChangeType.ToString()
      # get information about the changes detected
      Write-Host "Change detected:"
      $change | Out-Default
	
      & ($pathFolder + "\RequestApi.ps1")
      & ($pathFolder + "\SendEmail.ps1")
   }
else {Write-Host $change.ChangeType.ToString() }
}