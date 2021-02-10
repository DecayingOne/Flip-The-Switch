  (Get-AudioDevice -list)
  ($2 = Read-Host "Find the playback devices you wish to use. Enter the Index number of one of them now.")
  ($1 = Read-Host "Put the second index number in now")
 ## New-Item -Path "$Env:userprofile\Documents" -Name "FlipTheSwitch" -ItemType "directory"
  
    $DOCDIR = "$Env:userprofile\Documents"
    $TARGETDIR = "$DOCDIR\FlipTheSwitch"
    if(!(Test-Path -Path $TARGETDIR )){New-Item -ItemType directory -Path $TARGETDIR}
    
    if(Test-Path -Path "$Env:userprofile\Documents\FlipTheSwitch\FlipTheSwitch.ps1"){Remove-item -path "$Env:userprofile\Documents\FlipTheSwitch\FlipTheSwitch.ps1"}



  New-Item -Path "$Env:userprofile\Documents\FlipTheSwitch\" -Name "FlipTheSwitch.txt" -Force -ItemType "file" -Value '##$V = Get-audiodevice -playback'
  $File = "$Env:userprofile\Documents\FlipTheSwitch\FlipTheSwitch.txt"
  Add-content $File " ##Powershell requires this spacer for some reason"
  Add-content $File "if ((Get-audiodevice -playback).Index -eq $2)"
  Add-content $File "{set-audiodevice -index $1}"
  Add-content $File "else"
  Add-content $File "{set-audiodevice -index $2}"
  Rename-Item -Path "$Env:userprofile\Documents\FlipTheSwitch\FlipTheSwitch.txt" -Newname "FlipTheSwitch.ps1"

if (Test-Path -Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\FlipTheSwitch.lnk")
{Remove-Item "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\FlipTheSwitch.lnk"}

$TargetFile = """C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"""
$ShortcutFile = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\FlipTheSwitch.lnk"
$Hotkey = Read-Host "The hotkey will be Ctrl+Alt+(Letter). Type Desired Hotkey Letter"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.Arguments = "-version 4 -ExecutionPolicy Bypass -File $env:USERPROFILE\Documents\FlipTheSwitch\FlipTheSwitch.ps1"
$Shortcut.TargetPath = "$TargetFile"
$Shortcut.hotkey = "Ctrl+Alt+$Hotkey"
$Shortcut.Save()