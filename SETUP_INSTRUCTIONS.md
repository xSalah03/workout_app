# Workout Tracker - Supabase Setup Instructions

This guide walks you through setting up Supabase for the Workout Tracker app with proper authentication, database, and email verification.

## Prerequisites

- A Supabase account ([sign up here](https://supabase.com))
- Flutter development environment set up
- This project cloned locally

## Step 1: Create Supabase Project

1. Go to [Supabase Dashboard](https://supabase.com/dashboard)
2. Click **New Project**
3. Fill in:
   - **Name**: `workout-tracker` (or your preferred name)
   - **Database Password**: Generate a strong password (save it securely)
   - **Region**: Choose closest to your users
4. Click **Create new project** (this takes ~2 minutes)

## Step 2: Get API Credentials

1. In your project dashboard, click **Settings** (gear icon) → **API**
2. Copy these values:
   - **Project URL** (looks like `https://xxxxx.supabase.co`)
   - **anon/public key** (a long JWT token starting with `eyJ...`)

3. Create `.env` file in your project root:
   ```bash
   cp .env.example .env
   ```

4. Edit `.env` and paste your credentials:
   ```env
   SUPABASE_URL=https://your-project-ref.supabase.co
   SUPABASE_ANON_KEY=your-anon-key-here
   ```

> **Important**: Never commit `.env` to git. It's already in `.gitignore`.

## Step 3: Configure Email Authentication

### 3.1 Enable Email Confirmation (Required)

1. Go to **Authentication** → **Providers** in Supabase Dashboard
2. Find **Email** provider
3. Enable the toggle **"Confirm email"**
4. Click **Save**

> **Why?** This ensures users verify their email before accessing the app, improving security and reducing spam accounts.

### 3.2 Add Redirect URLs

1. Go to **Authentication** → **URL Configuration**
2. Under **Redirect URLs**, add this URL:
   ```
   com.workouttracker.workoutapp://auth-callback/
   ```
3. Click **Save**

> **Why?** This allows email verification and password reset links to open your mobile app instead of a web browser.

### 3.3 Customize Email Templates (Optional)

1. Go to **Authentication** → **Email Templates**
2. Customize these templates if desired:
   - **Confirm signup** - Sent when users sign up
   - **Magic Link** - For passwordless login (if you add this feature)
   - **Change Email Address** - When users update email
   - **Reset Password** - For password recovery

## Step 4: Set Up Database

### 4.1 Run Migration for Profiles Table

1. Go to **SQL Editor** in Supabase Dashboard
2. Click **New query**
3. Copy the contents of `supabase/migrations/001_profiles.sql` from this project
4. Paste into the SQL editor
5. Click **Run** or press `Cmd+Enter` (Mac) / `Ctrl+Enter` (Windows)

This creates:
- `profiles` table for storing usernames and avatars
- Row Level Security (RLS) policies for data protection
- Trigger to auto-create profiles on user signup

### 4.2 Verify Table Creation

1. Go to **Table Editor** in Supabase Dashboard
2. You should see a `profiles` table with columns:
   - `id` (uuid, primary key)
   - `username` (text, unique)
   - `display_name` (text)
   - `avatar_url` (text)
   - `created_at` (timestamptz)
   - `updated_at` (timestamptz)

## Step 5: Test Authentication

### 5.1 Run the App

```bash
flutter pub get
flutter run
```

### 5.2 Test Sign Up Flow

1. Open the app and click **Sign Up**
2. Enter:
   - Email: use a real email you can access
   - Username: choose a unique username
   - Password: at least 8 characters
   - Confirm Password: same as password
3. Click **Sign Up**
4. You should see: **"Check your email to verify your account"**
5. Check your inbox for verification email from Supabase
6. Click the verification link in the email
7. App should open (or show success page)

### 5.3 Test Sign In Flow

1. Try to sign in with unverified account:
   - Should show: **"Please verify your email before signing in"**
   - Option to resend verification email appears
2. After verifying email (from step 5.2), sign in:
   - Should successfully log you into the app
   - Navigate to home screen

### 5.4 Test Guest Mode

1. On login screen, click **Continue as Guest**
2. Should create local-only account
3. Data stored locally, can upgrade to full account later

## Step 6: Verify Database Setup

1. In Supabase Dashboard, go to **Table Editor** → **profiles**
2. You should see your profile entry with:
   - Your user ID
   - Your username (lowercased)
   - Your display name (original casing)
3. Go to **Authentication** → **Users**
4. You should see your user account with verified email

## Common Issues & Troubleshooting

### Issue: "Email not confirmed" when trying to sign in

**Solution**: 
- Check your email inbox (and spam folder) for verification email
- Click "Resend" button in the app to get a new verification email
- Make sure email confirmation is enabled in Supabase (Step 3.1)

### Issue: Profile creation fails silently

**Solution**:
- Verify you ran the migration SQL (Step 4.1)
- Check Supabase logs: **Database** → **Logs**
- The app will still work with just user_metadata, but username checking won't work

### Issue: Email redirects to web browser instead of app

**Solution**:
- Verify redirect URL is added in Supabase (Step 3.2)
- For mobile apps, ensure deep linking is set up in your Flutter project
- Check `android/app/src/main/AndroidManifest.xml` and `ios/Runner/Info.plist` for deep link configuration

### Issue: "Failed to sign up" error

**Possible causes**:
1. **Weak password**: Must be at least 8 characters
2. **Email already registered**: Try different email or sign in instead
3. **Username already taken**: Choose different username
4. **Network issue**: Check internet connection
5. **Rate limit**: Wait a few minutes and try again

### Issue: Can't receive emails from Supabase

**Solution**:
1. Check spam/junk folder
2. Add `noreply@mail.app.supabase.io` to your email contacts
3. For custom domain emails in production, configure SMTP settings in Supabase
4. Check Supabase logs for email delivery status

## Production Checklist

Before launching to production, ensure:

- [ ] Email confirmation is enabled
- [ ] Redirect URLs are configured for your production domains
- [ ] Email templates are customized with your branding
- [ ] Rate limiting is configured to prevent abuse
- [ ] RLS policies are enabled on all tables
- [ ] Database backups are configured
- [ ] Consider adding custom SMTP for email delivery
- [ ] Set up monitoring and error tracking
- [ ] Test password reset flow
- [ ] Test account upgrade flow (guest → full account)

## Additional Resources

- [Supabase Auth Documentation](https://supabase.com/docs/guides/auth)
- [Row Level Security Guide](https://supabase.com/docs/guides/auth/row-level-security)
- [Email Templates](https://supabase.com/docs/guides/auth/auth-email-templates)
- [Flutter Supabase Client](https://pub.dev/packages/supabase_flutter)

## Need Help?

- Check Supabase Logs: **Database** → **Logs** or **Edge Functions** → **Logs**
- Review this project's `ARCHITECTURE.md` for code structure
- File an issue on the project repository
- Join [Supabase Discord](https://discord.supabase.com) for community support
