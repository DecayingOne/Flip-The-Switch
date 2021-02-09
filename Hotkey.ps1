$TargetFile = """C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"""
$ShortcutFile = "C:\Users\$env:username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\FlipTheSwitch.lnk"
$Hotkey = Read-Host "The hotkey will be Ctrl+Alt+(Letter). Type Desired Hotkey Letter"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.Arguments = "-version 4 -ExecutionPolicy Bypass -File C:\Admin\Scripts\FlipTheSwitch\FlipTheSwitch-live.ps1"
$Shortcut.TargetPath = $TargetFile
$Shortcut.hotkey = "Ctrl+Alt+$Hotkey"
$Shortcut.Save()