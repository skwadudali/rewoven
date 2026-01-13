# Rewoven - Tackling Textile Waste Through Gamified Sustainability Education

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## 📱 About Rewoven

Rewoven is a gamified sustainability education mobile app that addresses one of the fastest-growing environmental problems: textile waste. The app teaches students about textile waste, circular economy principles, and responsible consumption through an engaging, interactive learning experience.

### 🌟 Key Features

- **📚 5 Learning Categories:**
  - **Fast Fashion** - Learn about the environmental impact of fast fashion
  - **Circular Economy** - Understand circular economy principles in textiles
  - **Textile Lifecycle** - Explore the complete journey of textiles
  - **Sustainable Brands** - Discover brands making a positive impact
  - **Upcycling & Repair** - Master practical upcycling skills

- **🎯 Gamified Learning:**
  - Interactive quizzes with instant feedback
  - Real-world challenges that promote behavior change
  - Points and rewards system
  - Achievement badges
  - Progress tracking with growth charts

- **👤 Student Tracking:**
  - Secure login with student ID
  - Personal progress dashboard
  - Achievement history
  - Growth analytics

- **📊 Progress Visualization:**
  - Real-time growth charts
  - Category completion tracking
  - Points accumulation display
  - Badge showcase

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode (for running on emulators)
- A physical device or emulator for testing

### Installation

1. **Clone the repository or navigate to the project directory:**
   ```bash
   cd "d:\premier genie webdevelopment\flutter\Flutter_application2"
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run
   ```

## 📱 How to Use

### Registration & Login

1. **First-time users:**
   - Open the app and tap "Register"
   - Enter your full name
   - Enter your student ID
   - Enter your class (e.g., Grade 10A)
   - Create a password
   - Tap "Register" to create your account

2. **Returning users:**
   - Enter your student ID
   - Enter your password
   - Tap "Login"

### Learning Journey

1. **Browse Categories:**
   - View all 5 sustainability categories from the home screen or categories tab
   - Each category shows available quizzes and challenges

2. **Take Quizzes:**
   - Select a category
   - Choose a quiz to start learning
   - Answer multiple-choice questions
   - Get instant feedback and explanations
   - Earn points based on your score

3. **Complete Challenges:**
   - Unlock real-world challenges by completing quizzes
   - Take action in your daily life
   - Document your efforts
   - Earn bonus points and badges

4. **Track Progress:**
   - View your total points on the home screen
   - Check your growth chart
   - See earned badges
   - Monitor category completion

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/                            # Data models
│   ├── student.dart                   # Student user model
│   ├── category.dart                  # Learning categories
│   ├── quiz.dart                      # Quiz and questions
│   ├── challenge.dart                 # Challenges
│   ├── badge.dart                     # Badges and achievements
│   └── progress.dart                  # Progress tracking
├── services/                          # Business logic
│   └── database_service.dart          # SQLite database operations
├── providers/                         # State management
│   ├── auth_provider.dart             # Authentication state
│   └── progress_provider.dart         # Progress tracking state
└── screens/                           # UI screens
    ├── splash_screen.dart             # Splash screen
    ├── auth/                          # Authentication screens
    │   ├── login_screen.dart
    │   └── register_screen.dart
    ├── home/                          # Home dashboard
    │   └── home_screen.dart
    ├── categories/                    # Categories
    │   ├── categories_screen.dart
    │   └── category_detail_screen.dart
    ├── quiz/                          # Quiz interface
    │   └── quiz_screen.dart
    ├── challenges/                    # Challenges
    │   └── challenges_screen.dart
    └── profile/                       # User profile
        └── profile_screen.dart
```

## 🎮 Features Breakdown

### Authentication System
- Student registration with name, student ID, class, and password
- Secure login system
- Session persistence using SharedPreferences
- Automatic login on app restart

### Database
- Local SQLite database for offline functionality
- Stores student data, quiz results, challenges, and progress
- Tracks all learning activities
- Can be extended to sync with Firebase

### Quiz System
- Multiple categories with 5 quizzes each
- 3+ questions per quiz
- Multiple-choice format
- Instant feedback with explanations
- Points awarded based on performance
- Progress tracking for each quiz

### Challenges
- Real-world sustainability actions
- Three difficulty levels per category
- Documentation requirements
- Points rewards
- Completion tracking

### Gamification
- Points system for all activities
- 9 achievement badges to unlock
- Progress visualization with charts
- Category mastery tracking
- Leaderboard potential (future feature)

### Growth Tracking
- Visual progress charts
- Activity history
- Points accumulation over time
- Category completion percentages

## 🛠️ Technologies Used

- **Flutter**: Cross-platform mobile framework
- **Dart**: Programming language
- **Provider**: State management
- **SQLite (sqflite)**: Local database
- **fl_chart**: Charts and data visualization
- **SharedPreferences**: Local data persistence

## 📚 Learning Content

### Category 1: Fast Fashion
Learn about the environmental impact of fast fashion, including water usage, carbon emissions, and textile waste.

**Key Topics:**
- Environmental impact of fast fashion
- True cost of cheap clothing
- Fashion trends and sustainability
- Impact on textile workers
- Alternatives to fast fashion

### Category 2: Circular Economy
Understand how circular economy principles can transform the textile industry.

**Key Topics:**
- Circular economy fundamentals
- Closing the loop in production
- Design for recyclability
- Business models for sustainability
- Consumer role in circular economy

### Category 3: Textile Lifecycle
Explore the complete journey of textiles from production to disposal.

**Key Topics:**
- Production processes
- Carbon footprint of textiles
- Water usage in manufacturing
- Chemical impacts
- End-of-life options

### Category 4: Sustainable Brands
Discover how to identify truly sustainable fashion brands.

**Key Topics:**
- Identifying sustainable brands
- Certifications and eco-labels
- Spotting greenwashing
- Leading sustainable brands
- Ethical fashion options

### Category 5: Upcycling & Repair
Master practical skills to extend clothing life and create from waste.

**Key Topics:**
- Basic repair techniques
- Creative upcycling ideas
- Transforming fabric scraps
- Rewoven's upcycling model
- DIY sustainable projects

## 🎯 Educational Impact

Rewoven aims to:
1. **Educate** students about textile waste before it happens
2. **Engage** through gamified, interactive learning
3. **Empower** students to make sustainable choices
4. **Encourage** real-world action through challenges
5. **Track** behavior change and learning progress

## 🔮 Future Enhancements

- [ ] Social features (share achievements, challenge friends)
- [ ] Leaderboards for healthy competition
- [ ] Push notifications for daily challenges
- [ ] Integration with Rewoven's physical upcycling workshops
- [ ] QR code scanning for upcycled products
- [ ] Community forum for sustainability discussions
- [ ] Integration with school curriculums
- [ ] Teacher dashboard for classroom management
- [ ] Multi-language support
- [ ] Advanced analytics and insights

## 📄 License

This project is created for educational purposes as part of the Rewoven sustainability initiative.

## 👥 Support

For questions or support:
- Create an issue in the repository
- Contact: rewoven@sustainabilityedu.org

## 🌱 Contributing

We welcome contributions! To contribute:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

---

**Rewoven** - Building a generation that understands textile waste is a solvable problem. 🌍♻️
