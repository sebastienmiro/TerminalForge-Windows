![PowerShell](https://img.shields.io/badge/PowerShell-7+-5391FE)
![Windows](https://img.shields.io/badge/Windows-10%2F11-blue)
![License](https://img.shields.io/badge/license-MIT-green)
# 🚀 TerminalForge Windows

Un environnement terminal moderne pour Windows inspiré des setups Linux/macOS avancés.

TerminalForge transforme Windows Terminal en un environnement de développement moderne avec :

- PowerShell 7
- Oh My Posh
- Nerd Fonts
- outils CLI modernes
- navigation intelligente
- prompt premium
- expérience Unix-like

---

# ✨ Fonctionnalités

## Inclus automatiquement

- ✅ Windows Terminal
- ✅ PowerShell 7
- ✅ Oh My Posh
- ✅ Nerd Fonts
- ✅ Git intégré
- ✅ Fuzzy finder
- ✅ autocomplétion avancée
- ✅ icônes fichiers/dossiers
- ✅ aliases Linux
- ✅ outils modernes ultra rapides

---

# 📦 Outils installés

| Outil | Description |
|---|---|
| Oh My Posh | Prompt moderne |
| Terminal-Icons | Icônes fichiers |
| posh-git | Intégration Git |
| PSFzf | Recherche fuzzy |
| zoxide | Navigation intelligente |
| eza | Remplaçant moderne de ls |
| bat | Remplaçant moderne de cat |
| ripgrep | grep ultra rapide |
| fd | find moderne |

---

# 🖥 Aperçu

Ajoutez vos screenshots dans :

```text
/screenshots
```

---

# ⚡ Installation

## 1. Ouvrir PowerShell 7 en administrateur

Lancer :

```powershell
pwsh
```

---

## 2. Autoriser temporairement les scripts

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
```

---

## 3. Exécuter le script

```powershell
.\setup-terminal.ps1
```

---

# ⚠ Important — Windows Defender

Si le **Contrôle d’accès aux dossiers** est activé dans Microsoft Defender, vous devez autoriser :

- `pwsh.exe`
- `WindowsTerminal.exe`
- `Code.exe`
- `git.exe`

Sinon :
- les modules PowerShell ne pourront pas s’installer
- le profil PowerShell sera bloqué
- certaines configurations échoueront

---

# 🎨 Police recommandée

Utilisez :

```text
CaskaydiaCove Nerd Font
```

Dans :

- Windows Terminal
- Settings
- Defaults
- Appearance
- Font face

---

# 🔥 Raccourcis utiles

| Raccourci | Action |
|---|---|
| Ctrl+r | Recherche fuzzy historique |
| Ctrl+t | Recherche fuzzy fichiers |

---

# 🧰 Commandes utiles

```powershell
la
lt
reload-profile
z projet
```

---

# 🐧 Aliases Linux

| Alias | Commande |
|---|---|
| ls | eza |
| cat | bat |
| grep | rg |
| find | fd |

---

# 📁 Structure du projet

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

# 🛠 Technologies utilisées

- PowerShell 7
- Windows Terminal
- Oh My Posh
- Nerd Fonts
- Winget

---

# 📜 Licence

MIT

---

# ❤️ Contribution

Les pull requests et suggestions sont les bienvenues.
