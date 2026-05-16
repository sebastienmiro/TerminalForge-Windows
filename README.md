![PowerShell](https://img.shields.io/badge/PowerShell-7+-5391FE)
![Windows](https://img.shields.io/badge/Windows-10%2F11-blue)
![License](https://img.shields.io/badge/license-MIT-green)
# 🚀 TerminalForge Windows

A modern Windows terminal environment inspired by advanced Linux/macOS setups.


TerminalForge transforms Windows Terminal into a premium Unix-like development environment with:

- PowerShell 7
- Oh My Posh
- Nerd Fonts
- modern CLI tools
- smart navigation
- premium prompt
- Linux-style workflow

---

# ✨ Features

## Included automatically

- ✅ Windows Terminal
- ✅ PowerShell 7
- ✅ Oh My Posh
- ✅ Nerd Fonts
- ✅ Git integration
- ✅ Fuzzy finder
- ✅ smart autocomplete
- ✅ file/folder icons
- ✅ Linux aliases
- ✅ modern ultra-fast CLI tools

---

# 📦 Installed tools

| Tool | Purpose |
|---|---|
| Oh My Posh | Modern prompt |
| Terminal-Icons | File icons |
| posh-git | Git integration |
| PSFzf | Fuzzy finder |
| zoxide | Smart directory jumping |
| eza | Modern ls replacement |
| bat | Better cat |
| ripgrep | Ultra-fast grep |
| fd | Modern find |

---

# 🖥 Preview

Add your screenshots inside:

```text
/screenshots
```

---

# ⚡ Installation

## 1. Open PowerShell 7 as administrator

Launch:

```powershell
pwsh
```

---

## 2. Temporarily allow scripts

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
```

---

## 3. Run setup script

```powershell
.\setup-terminal.ps1
```

---

# ⚠ Important — Windows Defender

If **Controlled Folder Access** is enabled in Microsoft Defender, you MUST allow:

- `pwsh.exe`
- `WindowsTerminal.exe`
- `Code.exe`
- `git.exe`

Otherwise:
- PowerShell modules may fail to install
- PowerShell profiles may be blocked
- some configurations may fail silently

---

# 🎨 Recommended font

Use:

```text
CaskaydiaCove Nerd Font
```

Inside:

- Windows Terminal
- Settings
- Defaults
- Appearance
- Font face

---

# 🔥 Useful shortcuts

| Shortcut | Action |
|---|---|
| Ctrl+r | Fuzzy history search |
| Ctrl+t | Fuzzy file search |

---

# 🧰 Useful commands

```powershell
la
lt
reload-profile
z project
```

---

# 🐧 Linux aliases

| Alias | Equivalent |
|---|---|
| ls | eza |
| cat | bat |
| grep | rg |
| find | fd |

---

# 📁 Project structure

```text
TerminalForge-Windows/
│
├── setup-terminal.ps1
├── README.md
├── README.fr.md
├── LICENSE
├── screenshots/
└── themes/
```

---

# 🛠 Built with

- PowerShell 7
- Windows Terminal
- Oh My Posh
- Nerd Fonts
- Winget

---

# 📜 License

MIT

---

# ❤️ Contributions

Pull requests and suggestions are welcome.
