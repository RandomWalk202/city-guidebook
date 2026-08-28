-- Run in Supabase Dashboard → SQL Editor (or via Supabase CLI)
-- Stores per-user 游后感 for city guidebooks (JSON blob per guide)

create table if not exists public.guide_notes (
  user_id uuid not null references auth.users (id) on delete cascade,
  guide text not null,
  notes jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, guide)
);

create index if not exists guide_notes_guide_idx on public.guide_notes (guide);

alter table public.guide_notes enable row level security;

create policy "guide_notes_select_own"
  on public.guide_notes
  for select
  to authenticated
  using (auth.uid() = user_id);

create policy "guide_notes_insert_own"
  on public.guide_notes
  for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "guide_notes_update_own"
  on public.guide_notes
  for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "guide_notes_delete_own"
  on public.guide_notes
  for delete
  to authenticated
  using (auth.uid() = user_id);
