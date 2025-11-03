# 🎯 Setup Finale: Studio Biancalani come Sottocartella di apheron.io

**URL Finale**: `apheron.io/studioprofessionalebiancalani`

---

## ✅ APPROCCIO CORRETTO

Per avere il sito come sottocartella, dobbiamo:
1. Copiare i file nella cartella `public` di apheron-homepage
2. Configurare i rewrites nel `firebase.json` di apheron-homepage
3. Aggiornare i percorsi relativi nel sito (se necessario)

---

## 📁 PASSO 1: Copiare File nella Cartella Public

1. Vai nella cartella `apheron-homepage/public/`
2. Crea una nuova cartella: `studioprofessionalebiancalani`
3. **Copia** tutti i file di Studio Biancalani in quella cartella:
   - `index.html`
   - Cartella `css/`
   - Cartella `js/`
   - Cartella `images/`
   - **NON copiare**: `firebase.json`, `functions/`, file `.md`, `.bat`, `.sh`

**Struttura finale:**
```
apheron-homepage/
  public/
    index.html (sito apheron esistente)
    studioprofessionalebiancalani/
      index.html
      css/
      js/
      images/
```

---

## ⚙️ PASSO 2: Configurare Rewrites in apheron-homepage

1. Apri `apheron-homepage/firebase.json`
2. **Aggiungi** rewrites per la sottocartella. La sezione `rewrites` dovrebbe essere così:

```json
{
  "hosting": {
    "public": "public",
    "rewrites": [
      {
        "source": "/studioprofessionalebiancalani",
        "destination": "/studioprofessionalebiancalani/index.html"
      },
      {
        "source": "/studioprofessionalebiancalani/**",
        "destination": "/studioprofessionalebiancalani/index.html"
      },
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "ignore": [...],
    "headers": [...]
  }
}
```

**Importante**: L'ultimo rewrite (`"source": "**"`) deve essere per ultimo, così il sito principale funziona.

---

## 🔧 PASSO 3: Verifica Percorsi Relativi

I percorsi nel sito Studio Biancalani dovrebbero già essere relativi (es: `css/styles.css` invece di `/css/styles.css`), quindi dovrebbero funzionare correttamente nella sottocartella.

Se ci sono problemi, potresti dover aggiungere un `<base>` tag in `index.html`.

---

## 🚀 PASSO 4: Deploy

1. Vai nella cartella `apheron-homepage`
2. Deploy:
   ```bash
   firebase deploy --only hosting
   ```

3. Verifica che tutto funzioni:
   - `apheron.io` → sito principale (non toccato)
   - `apheron.io/studioprofessionalebiancalani` → Studio Biancalani

---

## 📝 PASSO 5: Aggiornare Percorsi se Necessario

Se i CSS/JS/immagini non si caricano:

1. Apri `apheron-homepage/public/studioprofessionalebiancalani/index.html`
2. Nel `<head>`, aggiungi:
   ```html
   <base href="/studioprofessionalebiancalani/">
   ```

Questo dirà al browser che tutti i percorsi relativi partono da quella sottocartella.

---

## ⚠️ IMPORTANTE

- ✅ Il sito apheron.io principale rimane intatto
- ✅ Studio Biancalani è accessibile come sottocartella
- ✅ Le Functions restano nel progetto studiobiancalani-website (separate)
- ✅ Per aggiornare Studio Biancalani: copia nuovi file e ri-deploy apheron-homepage

---

## 🔄 WORKFLOW AGGIORNAMENTI

Quando modifichi Studio Biancalani:

1. Modifica i file nella cartella `studiobiancalani-website/`
2. Copia i file aggiornati in `apheron-homepage/public/studioprofessionalebiancalani/`
3. Deploy: `cd apheron-homepage` → `firebase deploy --only hosting`

---

## 🆘 TROUBLESHOOTING

### CSS/JS non si caricano
- Aggiungi `<base href="/studioprofessionalebiancalani/">` in index.html
- Verifica che i file siano nella cartella corretta

### 404 Error
- Verifica che i rewrites siano corretti in firebase.json
- Verifica che l'ultimo rewrite sia `"source": "**"` (per il sito principale)

### Il sito principale non funziona
- Verifica che l'ultimo rewrite sia `"source": "**"` → `"/index.html"`
- Questo serve per il sito principale

---

## ✅ CHECKLIST

- [ ] Copiati file in `apheron-homepage/public/studioprofessionalebiancalani/`
- [ ] Aggiunti rewrites in `apheron-homepage/firebase.json`
- [ ] (Opzionale) Aggiunto `<base>` tag se necessario
- [ ] Testato localmente (opzionale)
- [ ] Deploy eseguito
- [ ] Verificato `apheron.io/studioprofessionalebiancalani`

---

**Ora hai tutto quello che serve per pubblicare come sottocartella!** 🎯

