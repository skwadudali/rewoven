# Configuration Notes for Rewoven

## Android Configuration

### Package Name
The default package name should be updated in:
- `android/app/build.gradle`
- `android/app/src/main/AndroidManifest.xml`

Recommended package name: `com.rewoven.sustainabilityedu`

### Minimum SDK Version
The app requires Android SDK 21 (Android 5.0) or higher.

Update in `android/app/build.gradle`:
```gradle
android {
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 34
        ...
    }
}
```

### Permissions
The app uses the following permissions (already configured):
- INTERNET (for potential future Firebase sync)
- WRITE_EXTERNAL_STORAGE (for database)
- READ_EXTERNAL_STORAGE (for database)

### App Icon
To set a custom app icon:
1. Place your icon files in `android/app/src/main/res/mipmap-*/`
2. Or use the `flutter_launcher_icons` package (configured in pubspec.yaml)

## iOS Configuration

### Bundle Identifier
Update the bundle identifier in:
- `ios/Runner.xcodeproj/project.pbxproj`
- Xcode → Runner → General → Identity

Recommended: `com.rewoven.sustainabilityedu`

### Deployment Target
The app requires iOS 12.0 or higher.

Update in `ios/Podfile`:
```ruby
platform :ios, '12.0'
```

### App Icon
To set a custom app icon:
1. Open `ios/Runner.xcworkspace` in Xcode
2. Navigate to Runner → Assets.xcassets → AppIcon
3. Add your icon images in all required sizes

### Privacy Permissions
No special permissions are required for the current version.

## Firebase Configuration (Optional)

If you want to enable Firebase for cloud sync:

### Android Setup
1. Create a Firebase project at https://console.firebase.google.com
2. Add an Android app to your Firebase project
3. Download `google-services.json`
4. Place it in `android/app/`
5. Update `android/build.gradle`:
   ```gradle
   dependencies {
       classpath 'com.google.gms:google-services:4.3.15'
   }
   ```
6. Update `android/app/build.gradle`:
   ```gradle
   apply plugin: 'com.google.gms.google-services'
   ```

### iOS Setup
1. Add an iOS app to your Firebase project
2. Download `GoogleService-Info.plist`
3. Open `ios/Runner.xcworkspace` in Xcode
4. Add the file to the Runner target

## Database Configuration

### SQLite Database
The app uses SQLite for local storage. The database is created automatically on first launch.

**Location:**
- Android: `/data/data/com.yourcompany.rewoven/databases/rewoven.db`
- iOS: `Library/Application Support/rewoven.db`

**Tables:**
- students
- categories
- quizzes
- questions
- challenges
- student_challenges
- badges
- student_badges
- progress
- quiz_results

### Initial Data
The database is pre-populated with:
- 5 learning categories
- 9 achievement badges
- Sample quizzes and challenges

## App Signing (Release)

### Android Release Signing

1. Create a keystore:
```bash
keytool -genkey -v -keystore rewoven-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias rewoven
```

2. Create `android/key.properties`:
```properties
storePassword=<your-store-password>
keyPassword=<your-key-password>
keyAlias=rewoven
storeFile=<path-to-your-keystore>
```

3. Update `android/app/build.gradle`:
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    ...
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

### iOS Release Signing
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select Runner in the project navigator
3. Select the Runner target
4. Go to Signing & Capabilities
5. Select your development team
6. Xcode will automatically manage provisioning profiles

## Environment Variables

For different environments (dev, staging, prod), consider using:
- `flutter_dotenv` package
- Build flavors in Android
- Schemes in iOS

## Performance Optimization

### Release Mode
Always test in release mode before distributing:
```bash
flutter run --release
flutter build apk --release
flutter build ios --release
```

### Proguard (Android)
For code obfuscation and size reduction, enable Proguard in `android/app/build.gradle`:
```gradle
buildTypes {
    release {
        shrinkResources true
        minifyEnabled true
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }
}
```

## Testing

### Unit Tests
Run unit tests:
```bash
flutter test
```

### Integration Tests
Create integration tests in `integration_test/` directory.

### Device Testing
Test on multiple devices:
- Various screen sizes
- Different Android versions (5.0+)
- Different iOS versions (12.0+)

## Deployment

### Google Play Store (Android)
1. Build release APK or App Bundle
2. Create developer account
3. Upload to Google Play Console
4. Fill in store listing
5. Submit for review

### App Store (iOS)
1. Build release IPA
2. Open Xcode
3. Product → Archive
4. Upload to App Store Connect
5. Fill in app information
6. Submit for review

## Monitoring

Consider adding:
- Firebase Crashlytics for crash reporting
- Firebase Analytics for usage tracking
- Performance monitoring

## Notes

- Keep your keystore and credentials secure
- Never commit sensitive files to version control
- Update dependencies regularly: `flutter pub outdated`
- Test thoroughly before each release
- Follow platform-specific guidelines for store submissions

---

For more information, see the main README.md and QUICKSTART.md files.
