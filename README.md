# 4 dla 3

## Wdrożenie na Vercel

To statyczna strona HTML — nie wymaga instalowania zależności ani budowania projektu. Ustawienia wdrożenia są zapisane w `vercel.json`.

1. Zaimportuj repozytorium na [Vercel](https://vercel.com/new).
2. Pozostaw **Root Directory** jako `.` i wybierz **Deploy**.

Strona główna jest w pliku `index.html`.

Konkurs blogowy znajduje się na osobnej stronie `blog.html`. Formularze pomysłów i konkursu korzystają z opcjonalnego środowiska `window.claude`. Po wdrożeniu poza tym środowiskiem formularz konkursowy pozwala przygotować i skopiować zgłoszenie, ale nie zapisuje go w skrzynce komitetu.
