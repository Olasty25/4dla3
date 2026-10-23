-- Tabele na zgłoszenia z formularzy strony 4 dla 3.
-- Uruchom w Supabase: SQL Editor → New query → wklej całość → Run.
-- Odwiedzający stronę mogą tylko DODAWAĆ zgłoszenia; odczyt jest możliwy wyłącznie
-- z panelu Supabase (Table Editor), więc zgłoszenia widzi tylko komitet.

create table if not exists public.ideas (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  category text not null check (category in ('Wydarzenia', 'Nauka', 'Szkoła i przestrzeń', 'Sport', 'Inne')),
  text text not null check (char_length(text) between 1 and 600),
  klasa text not null default '' check (char_length(klasa) <= 12),
  podpis text not null default '' check (char_length(podpis) <= 40)
);

create table if not exists public.blog_posts (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  title text not null check (char_length(title) between 1 and 140),
  author text not null check (char_length(author) between 1 and 60),
  class_name text not null default '' check (char_length(class_name) <= 12),
  text text not null check (char_length(text) between 1 and 20000),
  html text not null check (char_length(html) <= 200000),
  media text[] not null default '{}' check (cardinality(media) <= 50)
);

alter table public.ideas enable row level security;
alter table public.blog_posts enable row level security;

drop policy if exists "Każdy może zgłosić pomysł" on public.ideas;
create policy "Każdy może zgłosić pomysł" on public.ideas
  for insert to anon with check (true);

drop policy if exists "Każdy może zgłosić wpis" on public.blog_posts;
create policy "Każdy może zgłosić wpis" on public.blog_posts
  for insert to anon with check (true);

revoke all on public.ideas, public.blog_posts from anon;
grant insert on public.ideas, public.blog_posts to anon;
