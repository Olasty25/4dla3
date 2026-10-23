# 4 dla 3

## Wdrożenie na Vercel

To statyczna strona HTML — nie wymaga instalowania zależności ani budowania projektu. Ustawienia wdrożenia są zapisane w `vercel.json`.

1. Zaimportuj repozytorium na [Vercel](https://vercel.com/new).
2. Pozostaw **Root Directory** jako `.` i wybierz **Deploy**.

Strona główna jest w pliku `index.html`.

Konkurs blogowy znajduje się na osobnej stronie `blog.html`. Formularz blogowy automatycznie zapisuje szkic w pamięci lokalnej przeglądarki, a jego edytor obsługuje formatowanie tekstu oraz wstawianie zdjęć i filmów z publicznych adresów URL.

## Baza zgłoszeń (Supabase)

Formularz pomysłów (`index.html`) i formularz konkursu blogowego (`blog.html`) zapisują zgłoszenia w bazie [Supabase](https://supabase.com) — tabele `ideas` i `blog_posts`.

1. Załóż darmowy projekt na Supabase.
2. Otwórz **SQL Editor**, wklej zawartość pliku `supabase.sql` i uruchom.
3. W **Project Settings → API** skopiuj **Project URL** oraz klucz publiczny (**anon** / **publishable**) i wpisz je w `db.js` (`SUPABASE_URL`, `SUPABASE_ANON_KEY`).
4. Wypchnij zmiany — Vercel wdroży stronę ponownie.

Klucz publiczny może być widoczny w kodzie strony: zasady RLS z `supabase.sql` pozwalają odwiedzającym tylko dodawać zgłoszenia, bez ich odczytywania. Zgłoszenia przegląda się w panelu Supabase (**Table Editor**). Nigdy nie wpisuj do `db.js` klucza `service_role` / secret.

Dopóki `db.js` nie jest uzupełniony, formularze korzystają z opcjonalnego środowiska `window.claude`, a poza nim pokazują zgłoszenie do skopiowania i ręcznego przekazania komitetowi.
