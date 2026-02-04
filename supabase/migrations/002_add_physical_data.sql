-- Profiles table migration v2 - Add physical user data
-- Run this in Supabase SQL Editor: Dashboard → SQL Editor → New query
-- This migration adds age, height, and weight tracking for fitness features

-- STEP 1: Add new columns to existing profiles table
-- These are nullable initially to support existing users
ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS age integer,
  ADD COLUMN IF NOT EXISTS height_cm numeric(5,2),
  ADD COLUMN IF NOT EXISTS weight_kg numeric(5,2);

-- STEP 2: Add validation constraints
-- Age: 13-120 years (13 is minimum per data protection laws like COPPA/GDPR)
-- Height: 50-300 cm (reasonable human range)
-- Weight: 20-500 kg (reasonable human range)
ALTER TABLE public.profiles
  ADD CONSTRAINT age_range CHECK (age IS NULL OR (age >= 13 AND age <= 120)),
  ADD CONSTRAINT height_range CHECK (height_cm IS NULL OR (height_cm >= 50 AND height_cm <= 300)),
  ADD CONSTRAINT weight_range CHECK (weight_kg IS NULL OR (weight_kg >= 20 AND weight_kg <= 500));

-- STEP 3: Update the trigger function to handle physical data from user metadata
-- This auto-populates profiles when users sign up via Supabase Auth
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
  INSERT INTO public.profiles (id, username, display_name, age, height_cm, weight_kg)
  VALUES (
    new.id,
    coalesce(new.raw_user_meta_data->>'username', split_part(new.email, '@', 1)),
    coalesce(new.raw_user_meta_data->>'display_name', new.raw_user_meta_data->>'username'),
    (new.raw_user_meta_data->>'age')::integer,
    (new.raw_user_meta_data->>'height_cm')::numeric,
    (new.raw_user_meta_data->>'weight_kg')::numeric
  )
  ON CONFLICT (id) DO UPDATE SET
    username = coalesce(excluded.username, profiles.username),
    display_name = coalesce(excluded.display_name, profiles.display_name),
    age = coalesce(excluded.age, profiles.age),
    height_cm = coalesce(excluded.height_cm, profiles.height_cm),
    weight_kg = coalesce(excluded.weight_kg, profiles.weight_kg),
    updated_at = now();
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- The trigger itself remains the same (already created in previous migration)
-- If you're running this on a fresh database, uncomment:
-- CREATE OR REPLACE TRIGGER on_auth_user_created
--   AFTER INSERT ON auth.users
--   FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- NOTES:
-- 1. Existing users will have NULL values for age, height_cm, weight_kg
-- 2. New signups will populate these from user_metadata
-- 3. App can prompt existing users to complete their profile
-- 4. All three fields are optional (nullable) to maintain backward compatibility
