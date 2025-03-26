# 🌐 Automatic App Language Switcher (Hammerspoon + Python)

This cute project automatically switches your macOS keyboard layout based on the active application.

## 🚀 Features:
- Automatically switches keyboard languages per application.
- Handles special localization cases (e.g., Hebrew apps).
- Shows user-friendly notifications only when the language actually changes.

## 📦 Requirements:
- macOS (tested on macOS Ventura and newer)
- [Hammerspoon](https://www.hammerspoon.org/)
- Python 3

## 🛠 Installation:

### Step 1: Install Dependencies
```bash
brew install --cask hammerspoon
brew install python3
```

### Step 2: Clone this repository
```bash
git clone git@github.com:EliyaHouri/hammerspoon-lang-switcher.git ~/.hammerspoon
```

### Step 3: Permissions
- Launch Hammerspoon.
- Open **System Settings → Privacy & Security → Accessibility**, and grant permissions to **Hammerspoon**.

### Step 4: Reload Configuration
- Click the Hammerspoon icon (🔨) in the menu bar.
- Select **Reload Config**.

You're all set! 🎉

## ⚙️ Customizing App Languages

Edit the file `~/.hammerspoon/lang_config.json` clearly and explicitly:

```json
{
    "hebrew": ["WhatsApp"],
    "english": ["Terminal", "Code", "Google Chrome"]
}
```

### How to Find Application Names
1. Open Hammerspoon Console (Hammerspoon menu → **Open Console**).
2. Activate the desired application.
3. The exact application name will appear in the console:
```
Activated app detected: YourAppName
```
- Copy exactly this name into `lang_config.json`.

### How to Find Keyboard Language IDs
Run in Terminal:
```bash
hs -c "hs.keycodes.currentSourceID()"
```
- Switch manually to the desired keyboard layout before running this command.
- Copy the exact ID into your configuration.

## 📚 Troubleshooting
- Make sure `lang_switcher.py` is executable:
```bash
chmod +x ~/.hammerspoon/lang_switcher.py
```

## 📝 Author
- **Eliyahu Houri** | [GitHub](https://github.com/EliyaHouri)
