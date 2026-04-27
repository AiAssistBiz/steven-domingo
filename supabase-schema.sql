-- Run this entire file in your Supabase SQL Editor
-- Dashboard → SQL Editor → New query → paste → Run

-- 1. CARDS TABLE
create table if not exists public.cards (
  id           bigint generated always as identity primary key,
  created_at   timestamptz default now(),
  type         text not null check (type in ('video','photo','graphic','link')),
  category     text not null check (category in ('health','investing','travel','business')),
  ratio        text default '9:16',
  title        text not null,
  subtitle     text,
  embed_url    text,
  image_url    text,
  overlay_steps text,
  graphic_text text,
  graphic_bg   text default '#0D1B3E',
  link_url     text,
  link_icon    text default '🔗',
  featured     boolean default false,
  published    boolean default true,
  sort_order   integer default 999
);

-- 2. ROW LEVEL SECURITY
alter table public.cards enable row level security;

-- Public can read published cards
create policy "Public read published"
  on public.cards for select
  using (published = true);

-- Authenticated users (you) can do everything
create policy "Auth full access"
  on public.cards for all
  using (auth.role() = 'authenticated');

-- 3. SEED DATA (optional — delete if you want to start blank)
insert into public.cards (type, category, ratio, title, subtitle, overlay_steps, featured, published, sort_order) values
  ('video','health','9:16','3-Day Water Fast Protocol','Prep, electrolytes, fasting days, and refeed.','Prep, Day 1, Day 2, Day 3, Refeed', true, true, 1),
  ('video','health','9:16','Daily Supplement Stack','Morning, post-workout, recovery, and evening timing.','AM, Training, Recovery, PM', false, true, 2),
  ('video','health','9:16','Training System','Strength, steps, conditioning, and mobility.','Lift, Walk, Recover, Repeat', false, true, 3),
  ('video','health','9:16','Longevity Framework','Systems for staying strong, clear, mobile, and healthy.','Strength • Mobility • Sleep • Nutrition', false, true, 4),
  ('video','investing','9:16','Portfolio Allocation System','How I split between equities, crypto, and cash.','Allocate, DCA, Hold, Review', true, true, 5),
  ('video','investing','9:16','Wealth Stack Order','The sequence I follow to build long-term net worth.','Earn, Save, Invest, Scale', false, true, 6),
  ('video','travel','9:16','Carry-On Only System','Pack for 30 days in one bag. Every time.','Book, Pack, Move, Settle', false, true, 7),
  ('video','business','9:16','Zero to Revenue Framework','The steps I take from idea to first dollar in 30 days.','Idea, Validate, Build, Launch', false, true, 8);
