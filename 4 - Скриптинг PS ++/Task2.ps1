$path="C:\Users\$env:UserName\Desktop"

New-Item -Path $path -Name "Task2" -Type Directory

Invoke-WebRequest https://pix.ru/download/master -OutFile "$path\Task2\master"

scp ps_user@109.107.169.151:.\psfile.txt $path

ping google.com | Out-File -FilePath "$path\Task2\google.txt"

Get-Help Get-Childitem | Out-File -FilePath "$path\Task2\info.txt"

ssh ps_user@109.107.169.151
