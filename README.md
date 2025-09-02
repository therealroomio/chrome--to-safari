# Open in Safari (Chrome Extension + macOS Helper)

A Chrome extension that adds a toolbar button to open the current tab directly in **Safari**.
Since Chrome extensions can’t launch apps directly, this project uses a **native macOS helper app** (written in Swift) via Chrome’s [Native Messaging API](https://developer.chrome.com/docs/apps/nativeMessaging/).

---

## 🚀 Features
- Adds a button beside the URL bar in Chrome.
- Opens the current page in Safari through a tiny native helper.
- macOS-native helper app written in Swift (runs silently in the background).
- Secure communication between Chrome and macOS via Native Messaging.

---

## 📦 Project Structure

```
chrome--to-safari/
├── chrome-extension/
│   ├── manifest.json
│   ├── package.json
│   ├── package-lock.json
│   ├── tsconfig.json
│   └── src/
│       └── background.ts
└── macos-helper/
    ├── OpenInSafariHelper.swift
    └── com.roomio.opensafari.json
```

---

## 🔧 Setup Instructions

### 1. Build the macOS Helper
1. Open `macos-helper/OpenInSafariHelper.swift` in **Xcode** (or compile with `swiftc`).
2. Build & run once to let macOS trust the app.
3. Place the built binary at `/Applications/OpenInSafariHelper.app/Contents/MacOS/OpenInSafariHelper` (or adjust the path in the messaging host manifest).

### 2. Register the Native Messaging Host
Create the config file: `~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.roomio.opensafari.json` and use the template provided in `macos-helper/com.roomio.opensafari.json`.

Replace:
- `__EXTENSION_ID__` with your extension’s ID (shown in `chrome://extensions` after loading unpacked).
- Update `path` if the helper app lives elsewhere.

### 3. Install the Chrome Extension
1. `cd chrome-extension && npm install && npm run build`
2. Open Chrome → `chrome://extensions/`.
3. Enable **Developer Mode**.
4. Click **Load Unpacked** and select the `chrome-extension` folder.

### 4. Test It
- Open any page in Chrome.
- Click the Safari button → it should launch the same page in Safari.

---

## 🛡 Permissions
The extension uses:
- `tabs` – to read the active tab’s URL.
- `nativeMessaging` – to talk to the macOS helper.

---

## ⚠️ Notes
- This is for personal / enterprise use. Publishing to the Chrome Web Store may be restricted because it launches external apps.
- macOS only (uses `/usr/bin/open` to launch Safari).
- For a quick hacky version, you can replace the Swift app with a shell script.

---

## 📜 License
MIT

---
