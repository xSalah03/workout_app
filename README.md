# workout_app

A production-ready Workout Tracker with offline-first architecture.

## Getting Started

### 1. Supabase setup (required for auth & sync)

Create a `.env` file with your Supabase credentials:

```bash
cp .env.example .env
```

Edit `.env` and add your values from [Supabase Dashboard](https://supabase.com/dashboard) → Project Settings → API:

- `SUPABASE_URL` – Project URL
- `SUPABASE_ANON_KEY` – anon public key

> ⚠️ Never commit `.env` – it's in `.gitignore`. Share only `.env.example` as a template.

### 2. Supabase Auth: URL configuration (fixes invalid verification link)

In [Supabase Dashboard](https://supabase.com/dashboard) → your project → **Authentication** → **URL Configuration**:

1. **Site URL**: Change from `http://localhost:3000` to:
   ```
   com.workouttracker.workoutapp://auth-callback/
   ```
2. **Redirect URLs**: Add (if not already present):
   ```
   com.workouttracker.workoutapp://auth-callback/**
   ```

Without this, the verification email redirects to `localhost:3000`, which fails on mobile.

### 3. Supabase Auth: Enable email confirmation

In **Authentication** → **Providers** → **Email**:

- Enable **"Confirm email"**

Users must verify their email before signing in. Unverified users get "Resend verification email" on sign-in attempt.

### 4. Supabase profiles table (for username uniqueness)

Run the migration in Supabase SQL Editor:

```bash
# Copy and run the contents of:
supabase/migrations/001_profiles.sql
```

Go to [Supabase Dashboard](https://supabase.com/dashboard) → your project → **SQL Editor** → New query → paste and run.

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
