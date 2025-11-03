# 🚀 Guida Completa: Pubblicare su GitHub e Firebase

Questa guida ti accompagna passo-passo per pubblicare il sito Studio Professionale Biancalani come sottocartella di `apheron.io/studioprofessionalebiancalani`.

## 📋 PREREQUISITI

- Account GitHub (crealo su [github.com](https://github.com) se non ce l'hai)
- Account Firebase (usato per apheron.io)
- Git installato sul tuo computer
- Firebase CLI installato (vedi passo 3)

---

## 🔧 PASSO 1: Preparare la Cartella Locale

1. **Apri VSCode** nella cartella `studiobiancalani-website`
2. **Apri il terminale** in VSCode (View → Terminal o `Ctrl+`` `)

---

## 📦 PASSO 2: Inizializzare Git (se non già fatto)

1. Nel terminale, verifica di essere nella cartella corretta:
   ```bash
   cd studiobiancalani-website
   ```

2. Controlla se Git è già inizializzato:
   ```bash
   git status
   ```
   - Se vedi errori, inizializza Git:
   ```bash
   git init
   ```

---

## 🌐 PASSO 3: Creare Repository su GitHub

1. Vai su [github.com](https://github.com) e accedi
2. Clicca sul **"+"** in alto a destra → **"New repository"**
3. Compila il form:
   - **Repository name**: `studioprofessionalebiancalani` (o un nome a tua scelta)
   - **Description**: "Sito web Studio Professionale Biancalani"
   - **Visibility**: Scegli Public o Private
   - **NON selezionare** "Add a README file" (lo abbiamo già)
   - **NON selezionare** ".gitignore" (lo abbiamo già)
   - **NON selezionare** "license"
4. Clicca **"Create repository"**

---

## 📤 PASSO 4: Collegare e Pushare su GitHub

1. **Nel terminale VSCode**, esegui questi comandi:

   ```bash
   git add .
   ```

   ```bash
   git commit -m "Initial commit - Studio Professionale Biancalani website"
   ```

   ```bash
   git branch -M main
   ```

   ```bash
   git remote add origin https://github.com/TUOUSERNAME/studioprofessionalebiancalani.git
   ```
   (Sostituisci `TUOUSERNAME` con il tuo username GitHub)

   ```bash
   git push -u origin main
   ```

2. Se richiesto, inserisci:
   - **Username**: il tuo username GitHub
   - **Password**: usa un **Personal Access Token** (non la password!)
   - Come creare il token: GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic) → Generate new token

---

## 🔥 PASSO 5: Installare Firebase CLI (se non già installato)

1. Nel terminale VSCode:
   ```bash
   npm install -g firebase-tools
   ```

2. Attendi il completamento dell'installazione

---

## 🔑 PASSO 6: Login Firebase

1. Nel terminale:
   ```bash
   firebase login
   ```

2. Si aprirà il browser per l'autenticazione
3. Completa il login con il tuo account Firebase (quello usato per apheron.io)

---

## 📁 PASSO 7: Navigare nella Cartella del Progetto Firebase

Il sito deve essere pubblicato come sottocartella del progetto `apheron.io`. Hai due opzioni:

### **Opzione A: Struttura Monorepo (Consigliata)**

Se il tuo progetto Firebase ha già una struttura con sottocartelle:

1. **Naviga nella cartella principale del progetto apheron.io** (quella con `firebase.json`)
2. **Crea la sottocartella**:
   ```bash
   cd C:\percorso\al\tuo\progetto\apheron
   mkdir studioprofessionalebiancalani
   ```

3. **Copia tutti i file** da `studiobiancalani-website` in questa cartella

4. **Oppure usa symlink o riferimenti** se preferisci mantenere i file separati

### **Opzione B: Progetto Firebase Separato**

Crea un nuovo progetto Firebase dedicato (se preferisci separare i progetti).

---

## ⚙️ PASSO 8: Configurare firebase.json

### **Opzione A - Se il sito è in una sottocartella del progetto principale:**

1. Vai nella cartella principale del progetto Firebase (`apheron.io`)
2. Apri o modifica `firebase.json`
3. Aggiungi la configurazione per la sottocartella. Il file dovrebbe avere una struttura simile a:

```json
{
  "hosting": [
    {
      "target": "apheron-main",
      "public": "public",
      "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
      "rewrites": [
        {
          "source": "/studioprofessionalebiancalani/**",
          "destination": "/studioprofessionalebiancalani/index.html"
        },
        {
          "source": "**",
          "destination": "/index.html"
        }
      ]
    }
  ]
}
```

**OPPURE** se vuoi pubblicare solo la sottocartella:

1. Nella cartella principale del progetto Firebase:
2. Crea/modifica `firebase.json`:
```json
{
  "hosting": {
    "public": "studioprofessionalebiancalani",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

### **Opzione B - Progetto Separato:**

1. Nella cartella `studiobiancalani-website`, crea `firebase.json`:
```json
{
  "hosting": {
    "public": ".",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

---

## 🔧 PASSO 9: Inizializzare Firebase Hosting

1. Nella cartella corretta (progetto principale o sottocartella), esegui:
   ```bash
   firebase init hosting
   ```

2. **Rispondi alle domande:**
   - **"What do you want to use as your public directory?"**: 
     - Se progetto separato: `.` (punto)
     - Se sottocartella: `studioprofessionalebiancalani`
   - **"Configure as a single-page app (rewrite all urls to /index.html)?"**: **No**
   - **"Set up automatic builds and deploys with GitHub?"**: **No** (per ora)
   - **"File public/index.html already exists. Overwrite?"**: **No**

---

## 📍 PASSO 10: Configurare il Dominio/Path (Opzionale)

Se vuoi che il sito sia accessibile come `apheron.io/studioprofessionalebiancalani`:

1. In **Firebase Console** → **Hosting**
2. Vai su **"Add custom domain"** o **"Configure"**
3. Aggiungi il path `/studioprofessionalebiancalani` se supportato
4. **OPPURE** configura un rewrite nel `firebase.json` come mostrato sopra

---

## 🚀 PASSO 11: Deploy

1. Nel terminale, nella cartella corretta:
   ```bash
   firebase deploy --only hosting
   ```

2. Attendi il completamento del deploy
3. Firebase ti darà l'URL del sito deployato

---

## ✅ PASSO 12: Verifica

1. Apri l'URL fornito da Firebase
2. Testa tutte le funzionalità:
   - Navigazione
   - Form contatti
   - Link interni
   - Responsive design

---

## 🔄 AGGIORNAMENTI FUTURI

Per aggiornare il sito dopo modifiche:

1. **Fai commit su GitHub:**
   ```bash
   git add .
   git commit -m "Descrizione modifiche"
   git push
   ```

2. **Deploy su Firebase:**
   ```bash
   firebase deploy --only hosting
   ```

---

## 🆘 RISOLUZIONE PROBLEMI

### "Firebase command not found"
- Reinstalla Firebase CLI: `npm install -g firebase-tools`

### "Permission denied"
- Verifica di essere loggato: `firebase login`
- Controlla i permessi del progetto Firebase

### "Public directory not found"
- Verifica il percorso in `firebase.json`
- Assicurati che `index.html` sia nella cartella public

### Link rotti o immagini non visibili
- Controlla i percorsi relativi (devono iniziare con `/` o `./`)
- Verifica che tutti i file siano nella cartella corretta

---

## 📝 NOTE IMPORTANTI

- **Struttura file**: Assicurati che tutti i file (CSS, JS, immagini) siano presenti
- **Percorsi relativi**: I percorsi devono essere relativi (es: `css/styles.css` non `/css/styles.css`)
- **HTTPS**: Firebase fornisce HTTPS automaticamente
- **Cache**: Potrebbe essere necessario svuotare la cache del browser dopo il deploy

---

Una volta completati questi passi, il sito sarà online! 🎉

