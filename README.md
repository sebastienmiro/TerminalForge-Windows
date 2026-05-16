# 🚀 TerminalForge Windows

Modern Windows Terminal setup powered by:

- PowerShell 7
- Oh My Posh
- Nerd Fonts
- Modern CLI tools
- Linux-like developer experience

Transform your Windows terminal into a modern Unix-style development environment.

---

# ✨ Features

## Included

- ✅ Windows Terminal
- ✅ PowerShell 7
- ✅ Oh My Posh
- ✅ Nerd Fonts
- ✅ Git integration
- ✅ Fuzzy search
- ✅ Smart autocomplete
- ✅ File icons
- ✅ Linux aliases
- ✅ Modern CLI utilities

---

# 📦 Installed tools

| Tool | Purpose |
|---|---|
| Oh My Posh | Modern prompt |
| Terminal-Icons | File icons |
| posh-git | Git integration |
| PSFzf | Fuzzy finder |
| zoxide | Smart directory jumping |
| eza | Modern ls |
| bat | Better cat |
| ripgrep | Better grep |
| fd | Better find |

---

# 🖥 Preview

Add screenshots here.

---

# ⚡ Installation

## 1. Open PowerShell 7 as Administrator

Launch:

```powershell
pwsh
```

---

## 2. Allow script execution

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
```

---

## 3. Run setup script

```powershell
.\setup-terminal.ps1
```

---

# ⚠ Windows Defender Warning

If you use **Controlled Folder Access**, you MUST allow:

- pwsh.exe
- WindowsTerminal.exe
- Code.exe
- git.exe

Otherwise PowerShell modules cannot install correctly.

---

# 🔥 Keyboard shortcuts

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

# 🎨 Recommended font

Use:

```text
CaskaydiaCove Nerd Font
```

Configure it inside Windows Terminal settings.

---

# 🐧 Linux-like aliases

| Alias | Equivalent |
|---|---|
| ls | eza |
| cat | bat |
| grep | rg |
| find | fd |

---

# 📜 License

MIT
