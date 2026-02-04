# workout_app

A production-ready Workout Tracker with offline-first architecture.

## Getting Started

## Getting Started

This project uses **Firebase** for authentication and data synchronization.

### 1. Firebase Setup

You need to initialize Firebase for your project:

1.  **Install FlutterFire CLI**:
    ```bash
    dart pub global activate flutterfire_cli
    ```

2.  **Configure Firebase**:
    Run the following command from the root of your project and follow the prompts:
    ```bash
    flutterfire configure
    ```
    This will generate `lib/firebase_options.dart` and register your apps in the Firebase Console.

### 2. Authentication Configuration

The app uses Firebase Auth with mandatory email verification.

1.  **Enable Email/Password**: Go to Firebase Console → Authentication → Sign-in method → Enable "Email/Password".
2.  **Email Verification**: New users must verify their email before they can sign in.
3.  **Username Uniqueness**: Handled automatically via Firestore `usernames` and `users` collections.

### 3. Deep Linking (Password Resets)

To handle password resets in-app, ensure you have configured:

1.  **Firebase Hosting**: Used for handling App Links/Universal Links.
2.  **Action URL**: Configure the "Action URL" in Firebase Console → Authentication → Settings to point to your hosting domain.
3.  **Associated Domains (iOS)** and **AssetLinks (Android)**: See the [Flutter Deep Linking documentation](https://docs.flutter.dev/ui/navigation/deep-linking) for details on setting up your verified domains.

### 4. Firestore Security Rules

Ensure you deploy the following basic rules (or more restrictive ones):

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    match /usernames/{username} {
      allow read: if true;
      allow write: if request.auth != null && request.resource.data.uid == request.auth.uid;
    }
    // Add rules for other collections (exercises, workout_plans, etc.)
  }
}
```

### 5. Run the app

```bash
flutter pub get
flutter run
```

---

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
