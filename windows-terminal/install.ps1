# Installs the Matcha Zen color scheme as a Windows Terminal JSON fragment (current user).
# Run:  powershell -ExecutionPolicy Bypass -File .\install.ps1
$ErrorActionPreference = 'Stop'
$dest = Join-Path $env:LOCALAPPDATA 'Microsoft\Windows Terminal\Fragments\matcha-zen'
New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item -Force (Join-Path $PSScriptRoot 'matcha-zen.json') (Join-Path $dest 'matcha-zen.json')
Write-Host "Installed to $dest"
Write-Host 'Restart Windows Terminal, then pick "Matcha Zen" under Settings > Profile > Appearance > Color scheme.'
