# iOS Build with GitHub Actions

This project uses GitHub Actions to build iOS apps without needing a Mac locally.

## Quick Start (No Signing - For Testing)

1. **Push your code to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit with iOS support"
   git branch -M main
   git remote add origin https://github.com/yourusername/yourrepo.git
   git push -u origin main
   ```

2. **Automatic Build**
   - The workflow will automatically run when you push to main/master
   - Or manually trigger it from GitHub Actions tab

3. **Download the Build**
   - Go to your GitHub repository
   - Click on "Actions" tab
   - Select the latest workflow run
   - Download the "ios-build" artifact
   - This will be an unsigned app (for simulator or development)

## Building Signed IPA (For Distribution)

To create a signed IPA that can be installed on physical devices or submitted to App Store:

### Prerequisites:
1. **Apple Developer Account** ($99/year)
2. **Signing Certificate** (p12 file)
3. **Provisioning Profile**
4. **Team ID**

### Setup Steps:

#### 1. Export your certificates:
On a Mac with Xcode:
- Open Keychain Access
- Select "My Certificates"
- Right-click your certificate → Export
- Save as .p12 file with a password
- Convert to base64:
  ```bash
  base64 -i certificate.p12 -o certificate.txt
  ```

#### 2. Export Provisioning Profile:
- Download from Apple Developer Portal
- Convert to base64:
  ```bash
  base64 -i profile.mobileprovision -o profile.txt
  ```

#### 3. Add GitHub Secrets:
Go to your GitHub repo → Settings → Secrets and variables → Actions → New repository secret

Add these secrets:
- `APPLE_CERT_P12_BASE64`: Content of certificate.txt
- `APPLE_CERT_PASSWORD`: Your p12 password
- `PROVISIONING_PROFILE_BASE64`: Content of profile.txt
- `APPLE_TEAM_ID`: Your Team ID from Apple Developer account

#### 4. Create ExportOptions.plist:
Create file at `ios/ExportOptions.plist`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>method</key>
    <string>app-store</string>
    <key>teamID</key>
    <string>YOUR_TEAM_ID</string>
    <key>uploadBitcode</key>
    <false/>
    <key>compileBitcode</key>
    <false/>
    <key>uploadSymbols</key>
    <true/>
</dict>
</plist>
```

#### 5. Trigger Signed Build:
- Go to Actions tab
- Select "iOS Build" workflow
- Click "Run workflow"
- Download the signed IPA artifact

## Installing on iPhone

### Method 1: Using Xcode (Recommended)
1. Download the build artifact
2. Connect iPhone to a Mac
3. Open Xcode → Window → Devices and Simulators
4. Drag the .app file to your device

### Method 2: Using TestFlight
1. Upload the signed IPA to App Store Connect
2. Add testers in TestFlight
3. Testers install via TestFlight app

### Method 3: Using Third-party Services
- Diawi.com
- InstallOnAir
- Firebase App Distribution

## Firebase iOS Configuration

Don't forget to add your iOS Firebase configuration:

1. Go to Firebase Console → Project Settings
2. Add iOS app with bundle ID: `com.example.rewoven`
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory
5. Commit and push

## Costs

- **GitHub Actions**: 
  - Free for public repos
  - 2000 minutes/month free for private repos
  - macOS runners use 10x multiplier (1 min = 10 mins)
  
- **Apple Developer Account**: $99/year (only for App Store distribution)

## Troubleshooting

**Build fails with signing error:**
- Check that all secrets are correctly set
- Verify certificate hasn't expired
- Ensure provisioning profile matches bundle ID

**Build succeeds but app won't install:**
- Unsigned builds only work with Xcode installation
- For direct device installation, you need a signed build

**Out of GitHub Actions minutes:**
- Use personal access to build only when needed
- Consider upgrading GitHub plan
- Or use a borrowed Mac occasionally

## Manual Build on Mac (Alternative)

If you have access to a Mac:
```bash
flutter build ios --release
# Or for IPA:
flutter build ipa --release
```

## Need Help?

Check Flutter documentation:
- https://docs.flutter.dev/deployment/ios
- https://docs.flutter.dev/testing/build-modes
