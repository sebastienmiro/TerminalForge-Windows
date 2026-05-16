# =========================================================
# TERMINALFORGE WINDOWS
# Ultimate Windows Terminal Setup
# =========================================================

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " TERMINALFORGE WINDOWS "
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# =========================================================
# PowerShell 7 check
# =========================================================

if ($PSVersionTable.PSVersion.Major -lt 7) {

    Write-Host "Run this script using PowerShell 7 (pwsh)." -ForegroundColor Red
    exit
}

# =========================================================
# Winget check
# =========================================================

if (!(Get-Command winget -ErrorAction SilentlyContinue)) {

    Write-Host "Winget is required." -ForegroundColor Red
    exit
}

# =========================================================
# Defender warning
# =========================================================

Write-Host ""
Write-Host "IMPORTANT DEFENDER NOTICE" -ForegroundColor Yellow
Write-Host ""
Write-Host "If Controlled Folder Access is enabled,"
Write-Host "allow:"
Write-Host ""
Write-Host " - pwsh.exe"
Write-Host " - WindowsTerminal.exe"
Write-Host " - Code.exe"
Write-Host " - git.exe"
Write-Host ""

Pause

# =========================================================
# Install applications
# =========================================================

Write-Host ""
Write-Host "Installing applications..." -ForegroundColor Cyan

$packages = @(
    "Microsoft.WindowsTerminal",
    "Microsoft.PowerShell",
    "JanDeDobbeleer.OhMyPosh",
    "Git.Git",
    "junegunn.fzf",
    "BurntSushi.ripgrep",
    "sharkdp.fd",
    "sharkdp.bat",
    "ajeetdsouza.zoxide",
    "eza-community.eza"
)

foreach ($pkg in $packages) {

    try {

        winget install `
            --id $pkg `
            -e `
            --silent `
            --accept-package-agreements `
            --accept-source-agreements
    }
    catch {

        Write-Host "Failed: $pkg" -ForegroundColor Yellow
    }
}

# =========================================================
# Install Nerd Font
# =========================================================

Write-Host ""
Write-Host "Installing Nerd Font..." -ForegroundColor Cyan

$fontZip = "$env:TEMP\CascadiaCode.zip"
$fontDir = "$env:TEMP\CascadiaCode"

try {

    Invoke-WebRequest `
        -Uri "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip" `
        -OutFile $fontZip

    Expand-Archive $fontZip $fontDir -Force

    Get-ChildItem "$fontDir\*.ttf" | ForEach-Object {

        Copy-Item $_ "C:\Windows\Fonts" -Force
    }
}
catch {

    Write-Host "Font install failed." -ForegroundColor Yellow
}

# =========================================================
# Prepare PowerShell
# =========================================================

Write-Host ""
Write-Host "Preparing PowerShell..." -ForegroundColor Cyan

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Install-PackageProvider NuGet -Force

Install-Module PowerShellGet `
    -Force `
    -AllowClobber

Import-Module PowerShellGet -Force

Set-PSRepository PSGallery `
    -InstallationPolicy Trusted

# =========================================================
# Install PowerShell modules
# =========================================================

Write-Host ""
Write-Host "Installing PowerShell modules..." -ForegroundColor Cyan

$modules = @(
    "Terminal-Icons",
    "posh-git",
    "PSFzf"
)

foreach ($module in $modules) {

    try {

        Install-Module `
            $module `
            -Scope CurrentUser `
            -Force `
            -AllowClobber `
            -SkipPublisherCheck
    }
    catch {

        Write-Host "Failed module: $module" -ForegroundColor Yellow
    }
}

# =========================================================
# Create PowerShell profile
# =========================================================

Write-Host ""
Write-Host "Creating PowerShell profile..." -ForegroundColor Cyan

$profileDir = Split-Path $PROFILE

New-Item `
    -ItemType Directory `
    -Path $profileDir `
    -Force | Out-Null

New-Item `
    -ItemType File `
    -Path $PROFILE `
    -Force | Out-Null

# =========================================================
# PowerShell profile content
# =========================================================

$profileContent = @"

oh-my-posh init pwsh --config "`$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression

# Safe module imports
`$modules = @(
    "Terminal-Icons",
    "posh-git",
    "PSFzf"
)

foreach (`$m in `$modules) {

    if (Get-Module -ListAvailable `$m) {

        Import-Module `$m
    }
}

# zoxide
Invoke-Expression (& {
    (zoxide init powershell | Out-String)
})

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# PSFzf
if (Get-Module -ListAvailable PSFzf) {

    Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'
}

# UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Linux aliases
Set-Alias ls eza
Set-Alias ll eza
Set-Alias cat bat
Set-Alias grep rg
Set-Alias find fd

function la {
    eza -la --icons
}

function lt {
    eza --tree --level=2 --icons
}

function reload-profile {
    . `$PROFILE
}

Clear-Host

"@

Set-Content `
    -Path $PROFILE `
    -Value $profileContent

# =========================================================
# Configure Windows Terminal
# =========================================================

Write-Host ""
Write-Host "Configuring Windows Terminal..." -ForegroundColor Cyan

$settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

if (Test-Path $settingsPath) {

    try {

        $settings = Get-Content $settingsPath -Raw | ConvertFrom-Json

        if ($settings.profiles.defaults -eq $null) {

            $settings.profiles | Add-Member `
                -MemberType NoteProperty `
                -Name defaults `
                -Value @{}
        }

        $settings.profiles.defaults.font = @{
            face = "CaskaydiaCove Nerd Font"
        }

        $settings | ConvertTo-Json -Depth 100 | Set-Content $settingsPath
    }
    catch {

        Write-Host "Terminal config failed." -ForegroundColor Yellow
    }
}

# =========================================================
# Finish
# =========================================================

Write-Host ""
Write-Host "=========================================" -ForegroundColor Green
Write-Host " INSTALLATION COMPLETE "
Write-Host "=========================================" -ForegroundColor Green
Write-Host ""

Write-Host "Restart Windows Terminal now." -ForegroundColor Yellow
Write-Host ""

Write-Host "Useful commands:" -ForegroundColor Cyan
Write-Host ""
Write-Host "la"
Write-Host "lt"
Write-Host "reload-profile"
Write-Host "z project"
Write-Host ""