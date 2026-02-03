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

### 2. Run the app

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
