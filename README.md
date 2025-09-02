# Open in Safari (Chrome Extension + macOS Helper)

A Chrome extension that adds a toolbar button to open the current tab directly in **Safari**.  
Since Chrome extensions can’t launch apps directly, this project uses a **native macOS helper app** (built with Swift) via Chrome’s [Native Messaging API](https://developer.chrome.com/docs/apps/nativeMessaging/).

---

## 🚀 Features
- Adds a button beside the URL bar in Chrome.
- Opens the current page instantly in Safari.
- macOS-native helper app written in Swift (runs silently in the background).
- Secure communication between Chrome and macOS via Native Messaging.

---

## 📦 Project Structure

open-in-safari/
├── chrome-extension/
│   ├── manifest.json
│   ├── background.js
│   └── icons/
│       ├── icon16.png
│       ├── icon48.png
│       └── icon128.png
└── macos-helper/
└── OpenInSafariHelper.xcodeproj

---

## 🔧 Setup Instructions

### 1. Build the macOS Helper
1. Open `macos-helper/OpenInSafariHelper.xcodeproj` in **Xcode**.
2. Build & run once to let macOS trust the app.
3. The built binary will be inside: ~/Applications/OpenInSafariHelper.app/Contents/MacOS/OpenInSafariHelper

### 2. Register the Native Messaging Host
Create the config file: ~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.roomio.opensafari.json

Add this content (update paths for your system):

```json
{
  "name": "com.roomio.opensafari",
  "description": "Open links in Safari",
  "path": "/Users/YOUR_USERNAME/Applications/OpenInSafariHelper.app/Contents/MacOS/OpenInSafariHelper",
  "type": "stdio",
  "allowed_origins": [
    "chrome-extension://YOUR_EXTENSION_ID/"
  ]
}
```

Replace:
	•	YOUR_USERNAME with your macOS username.
	•	YOUR_EXTENSION_ID with your extension’s ID (shown in chrome://extensions after loading unpacked).

3. Install the Chrome Extension
	1.	Open Chrome → go to chrome://extensions/.
	2.	Enable Developer Mode.
	3.	Click Load Unpacked.
	4.	Select the chrome-extension folder.

4. Test It
	•	Open any page in Chrome.
	•	Click the Safari button → it should launch the same page in Safari.

⸻

🛡 Permissions

The extension uses:
	•	tabs: to read the active tab’s URL.
	•	nativeMessaging: to talk to the macOS helper.

⸻

⚠️ Notes
	•	This is for personal / enterprise use.
Publishing to the Chrome Web Store may be restricted because it launches external apps.
	•	macOS only (uses /usr/bin/open to launch Safari).
	•	For a quick hacky version, you can replace the Swift app with a shell script.

⸻

📜 License

MIT
                  
---

