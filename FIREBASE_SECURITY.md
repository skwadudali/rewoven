# 🔐 Firebase Setup Guide (Secure)

Your Firebase credentials should **NEVER** be committed to GitHub. Follow this guide to set them up securely.

## Local Development Setup

### 1. Keep Firebase Files Locally (Already in .gitignore)

Your Firebase configuration files are in the `.gitignore` and should be on your local machine:
- `lib/firebase_options.dart`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`

These files are **required** locally but must **NEVER** be pushed to GitHub.

### 2. Verify Files Exist Locally

Check if these files are still on your computer:
```bash
# In your project root
dir lib/firebase_options.dart
dir android/app/google-services.json
```

If they're missing, regenerate them from Firebase Console:

#### For Android:
1. Go to https://console.firebase.google.com/
2. Select project "rewoven-f8963"
3. Click **⚙️ Project Settings**
4. Go to **Your apps** → Android app
5. Download `google-services.json`
6. Place it in `android/app/`

#### For iOS:
1. Same as above but for iOS app
2. Download `GoogleService-Info.plist`
3. Place it in `ios/Runner/`

#### For Dart:
1. Run: `flutterfire configure`
2. This will regenerate `lib/firebase_options.dart`

### 3. Generate New API Keys (IMPORTANT!)

The exposed key has been removed from Git, but you should **revoke it** in Google Cloud:

1. Go to https://console.cloud.google.com/
2. Select project "rewoven-f8963"
3. Go to **APIs & Services** → **Credentials**
4. **Delete** the exposed API key
5. Create a new Android/iOS API key
6. Update your `firebase_options.dart` with the new key

## GitHub Actions Setup (For CI/CD)

To use GitHub Actions while keeping credentials safe:

### Option 1: Upload Files to GitHub Secrets (Recommended)

1. **Encode files as base64:**
   ```bash
   # Windows PowerShell
   [Convert]::ToBase64String([System.IO.File]::ReadAllBytes("android/app/google-services.json")) | Out-Clipboard
   ```

2. **Add to GitHub Secrets:**
   - Go to your repo → Settings → Secrets and variables → Actions
   - Create secrets:
     - `GOOGLE_SERVICES_JSON_BASE64`: Paste the base64 content
     - `GOOGLE_SERVICE_INFO_PLIST_BASE64`: For iOS

3. **Update workflow to decode files:**
   ```yaml
   - name: Decode Firebase credentials
     run: |
       echo "${{ secrets.GOOGLE_SERVICES_JSON_BASE64 }}" | base64 --decode > android/app/google-services.json
   ```

### Option 2: Use FirebaseFlutter Plugin (Recommended)

Run locally once:
```bash
flutterfire configure
```

This generates the correct `firebase_options.dart` automatically.

## Security Checklist

- ✅ Firebase credentials removed from Git history
- ✅ Firebase files added to .gitignore
- ✅ Old API key revoked in Google Cloud
- ✅ New API key generated
- ✅ Local Firebase files still exist on computer
- ✅ Ready for team development

## For Team Members

When cloning this repo:
```bash
git clone https://github.com/skwadudali/rewoven.git
cd rewoven

# Ask project owner for:
# 1. lib/firebase_options.dart
# 2. android/app/google-services.json
# 3. ios/Runner/GoogleService-Info.plist

# Place these files in the correct locations
# Then run
flutter pub get
```

Never commit these files!
