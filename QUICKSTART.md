# Rewoven - Quick Start Guide

## 🚀 Running the App

### Step 1: Install Dependencies
```bash
cd "d:\premier genie webdevelopment\flutter\Flutter_application2"
flutter pub get
```

### Step 2: Check Flutter Setup
```bash
flutter doctor
```
Make sure you have:
- ✅ Flutter SDK installed
- ✅ At least one device/emulator available (Android or iOS)
- ✅ All dependencies resolved

### Step 3: Run the Application

**Option A: Using VS Code**
1. Open the project folder in VS Code
2. Press F5 or click Run → Start Debugging
3. Select your device from the device selector

**Option B: Using Terminal**
```bash
# Run on connected device or emulator
flutter run

# Run on specific device
flutter devices  # List available devices
flutter run -d <device-id>

# Run in release mode
flutter run --release
```

### Step 4: Build APK (Android)
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# The APK will be available at:
# build/app/outputs/flutter-apk/app-release.apk
```

### Step 5: Build for iOS
```bash
# Make sure you're on macOS with Xcode installed
flutter build ios --release
```

## 📱 Testing the App

### Create Your First Account

1. **Launch the app** - You'll see the Rewoven splash screen
2. **Click "Register"** on the login screen
3. **Fill in the registration form:**
   - Full Name: John Doe
   - Student ID: STU001
   - Class: Grade 10A
   - Password: test123
4. **Click "Register"** - You'll be logged in automatically

### Explore Categories

1. **View the Dashboard** - See your welcome message and stats
2. **Browse Categories** - Explore all 5 sustainability categories:
   - 👕 Fast Fashion
   - ♻️ Circular Economy
   - 🌍 Textile Lifecycle
   - 🌱 Sustainable Brands
   - ✂️ Upcycling & Repair

### Take Your First Quiz

1. **Select a category** (e.g., Fast Fashion)
2. **Choose Quiz 1** from the list
3. **Answer the questions** - You'll get instant feedback
4. **Complete the quiz** - Earn points and see your score!

### Track Your Progress

1. **Check your points** - Visible in the top-right corner
2. **View growth chart** - See your learning progress over time
3. **Check earned badges** - Unlock achievements as you learn
4. **Review profile** - See all your stats in one place

## 🎮 Sample Test Accounts

For testing purposes, you can create multiple accounts:

| Name | Student ID | Class | Password |
|------|-----------|-------|----------|
| Alice Green | STU001 | Grade 10A | test123 |
| Bob Smith | STU002 | Grade 10B | test123 |
| Carol White | STU003 | Grade 11A | test123 |

## 🐛 Troubleshooting

### Issue: Dependencies not installing
```bash
flutter clean
flutter pub get
```

### Issue: App won't run on device
```bash
# Check connected devices
flutter devices

# Check for issues
flutter doctor -v

# For Android: Enable USB debugging on your device
# For iOS: Trust your developer certificate
```

### Issue: Build errors
```bash
# Clean build files
flutter clean

# Reinstall dependencies
flutter pub get

# Rebuild
flutter run
```

### Issue: Database errors
- Delete the app from your device/emulator
- Reinstall to create a fresh database

## 📊 Database Location

The SQLite database is stored locally on the device:
- **Android:** `/data/data/com.yourcompany.rewoven/databases/rewoven.db`
- **iOS:** `Library/Application Support/rewoven.db`

You can inspect the database using:
```bash
# For Android
adb shell
run-as com.yourcompany.rewoven
cd databases
sqlite3 rewoven.db
```

## 🔧 Development Tips

### Hot Reload
- Press `r` in the terminal while the app is running
- Or press `Ctrl+S` / `Cmd+S` in your editor

### Hot Restart
- Press `R` in the terminal
- Useful when you change state management or assets

### View Logs
```bash
flutter logs
```

### Run Tests
```bash
flutter test
```

### Check Code Quality
```bash
flutter analyze
```

## 📦 Project Structure Overview

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models (Student, Quiz, etc.)
├── services/                 # Business logic (Database)
├── providers/                # State management (Auth, Progress)
└── screens/                  # UI screens
    ├── auth/                # Login & Registration
    ├── home/                # Dashboard
    ├── categories/          # Learning categories
    ├── quiz/                # Quiz interface
    ├── challenges/          # Challenges
    └── profile/             # User profile
```

## 🌟 Key Features to Test

1. **Authentication**
   - ✅ Student registration
   - ✅ Login with credentials
   - ✅ Session persistence
   - ✅ Logout

2. **Learning**
   - ✅ Browse 5 categories
   - ✅ Take quizzes
   - ✅ Get instant feedback
   - ✅ Earn points

3. **Gamification**
   - ✅ Points system
   - ✅ Badge unlocking
   - ✅ Progress tracking
   - ✅ Growth charts

4. **Profile**
   - ✅ View student info
   - ✅ Check total points
   - ✅ See achievements
   - ✅ Logout

## 📞 Need Help?

- Check the main README.md for detailed documentation
- Review Flutter documentation: https://flutter.dev/docs
- Check issues in the repository

## 🎯 Next Steps

1. Complete all quizzes in one category
2. Try to unlock your first badge (10 points)
3. Explore different categories
4. Track your progress on the growth chart
5. Challenge yourself to earn 100 points!

---

Happy Learning! 🌍♻️
