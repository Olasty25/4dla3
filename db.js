/* Zapisywanie zgłoszeń w bazie Supabase.
   Uzupełnij adres projektu i klucz publiczny (anon / publishable) z Project Settings → API.
   Schemat tabel jest w pliku supabase.sql. Dopóki pola są puste, formularze działają jak wcześniej. */
(() => {
  const SUPABASE_URL = 'https://mzunnwppaieupyjqkqhf.supabase.co';
  const SUPABASE_ANON_KEY = 'sb_publishable_IwqhagWD4AywR9ffQYh7tQ_GApXGojt';

  window.submissionsDb = {
    enabled: Boolean(SUPABASE_URL && SUPABASE_ANON_KEY),
    async insert(table, row) {
      const headers = {
        apikey: SUPABASE_ANON_KEY,
        'Content-Type': 'application/json',
        Prefer: 'return=minimal'
      };
      // Starsze klucze anon to tokeny JWT i muszą trafić także do nagłówka Authorization.
      if (SUPABASE_ANON_KEY.startsWith('eyJ')) headers.Authorization = 'Bearer ' + SUPABASE_ANON_KEY;
      const response = await fetch(SUPABASE_URL.replace(/\/+$/, '') + '/rest/v1/' + table, {
        method: 'POST',
        headers,
        body: JSON.stringify(row)
      });
      if (!response.ok) {
        const error = new Error('Nie udało się zapisać zgłoszenia (HTTP ' + response.status + ').');
        error.status = response.status;
        throw error;
      }
    }
  };
})();
