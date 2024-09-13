$path="C:\Users\$env:UserName\Desktop"

New-Item -Path $path -Name "Task1" -ItemType Directory

Get-Command
Get-Command > "$path\Task1\commands"

Set-ExecutionPolicy RemoteSigned

$a=1
while ($a -le 100)
{
	(Get-Content -Path "$path\Task1\commands" -TotalCount $a)[-1] > "$path\Task1\$a.txt"
	$a++
}

$color = [Enum]::GetValues([System.ConsoleColor]) | Get-Random
echo $color

Select-String -Path "$path\Task1\commands" -Pattern "Set-" | Write-Host -ForegroundColor $color