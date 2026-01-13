rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if true;
      match /progress/{document=**} {
        allow read, write: if true;
      }
    }
    match /quizzes/{document=**} {
      allow read: if true;
      allow write: if false;
    }
    match /challenges/{document=**} {
      allow read: if true;
      allow write: if false;
    }
    match /categories/{document=**} {
      allow read: if true;
      allow write: if false;
    }
  }
}
