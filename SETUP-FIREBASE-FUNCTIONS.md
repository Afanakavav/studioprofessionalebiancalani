# 🔥 Setup Completo Firebase Cloud Functions per Invio Email

Guida passo-passo per configurare l'invio email tramite Firebase Cloud Functions.

> **⚡ VUOI UN SETUP RAPIDO?** Usa gli script automatici! Vedi `SETUP-RAPIDO.md` per iniziare subito.

---

## 📋 PREREQUISITI

- Account Firebase (quello che usi per apheron.io)
- Node.js installato (versione 18 o superiore)
- Firebase CLI installato
- Gmail account per l'invio email (o altro servizio SMTP)

---

## 🚀 PASSO 1: Installare Firebase CLI (se non già installato)

1. Apri il terminale
2. Installa Firebase CLI globalmente:
   ```bash
   npm install -g firebase-tools
   ```

3. Verifica l'installazione:
   ```bash
   firebase --version
   ```

---

## 🔑 PASSO 2: Login Firebase

1. Nel terminale, naviga nella cartella del progetto:
   ```bash
   cd studiobiancalani-website
   ```

2. Esegui il login:
   ```bash
   firebase login
   ```

3. Si aprirà il browser per l'autenticazione - completa il login

---

## 📦 PASSO 3: Installare Dipendenze Functions

1. Naviga nella cartella `functions`:
   ```bash
   cd functions
   ```

2. Installa le dipendenze:
   ```bash
   npm install
   ```

3. Questo installerà:
   - `firebase-functions`
   - `firebase-admin`
   - `nodemailer`
   - `cors`

---

## ⚙️ PASSO 4: Inizializzare Firebase Functions

1. Torna alla root del progetto:
   ```bash
   cd ..
   ```

2. Inizializza Firebase Functions (se non già fatto):
   ```bash
   firebase init functions
   ```

3. Rispondi alle domande:
   - **"Which language do you want to use?"**: JavaScript
   - **"Do you want to use ESLint?"**: Sì (consigliato) o No
   - **"Do you want to install dependencies with npm now?"**: Sì

4. Seleziona il progetto Firebase esistente (apheron.io)

---

## 📧 PASSO 5: Configurare Credenziali Email Gmail

### Opzione A: App Password Gmail (Consigliato)

1. Vai su [Google Account Security](https://myaccount.google.com/security)
2. Attiva la **verifica in due passaggi** se non già attiva
3. Vai su **"App passwords"** (Password per app)
4. Genera una nuova password per app:
   - Seleziona **"Mail"** come app
   - Seleziona **"Other (Custom name)"** come dispositivo
   - Inserisci: "Firebase Functions"
   - Clicca **"Generate"**
5. **COPIA LA PASSWORD GENERATA** (16 caratteri senza spazi)

### Opzione B: Credenziali SMTP Alternative

Se usi un altro provider email, modifica `functions/index.js` con le credenziali corrette.

---

## 🔐 PASSO 6: Configurare Variabili d'Ambiente Firebase

1. Nel terminale, nella root del progetto:
   ```bash
   firebase functions:config:set email.user="tua-email@gmail.com"
   ```

2. Configura la password:
   ```bash
   firebase functions:config:set email.password="tua-app-password-gmail"
   ```

   (Sostituisci con l'email e la password app che hai generato)

3. Verifica la configurazione:
   ```bash
   firebase functions:config:get
   ```

---

## 🎯 PASSO 7: Configurare Firebase nel Frontend

1. Vai su [Firebase Console](https://console.firebase.google.com/)
2. Seleziona il tuo progetto (apheron.io)
3. Vai su **⚙️ Settings** → **Project settings**
4. Scorri fino a **"Your apps"**
5. Se non c'è ancora un'app web, clicca **"Add app"** → **Web** (`</>`)
6. Registra l'app con un nickname (es: "Studio Biancalani Web")
7. **COPIA LA CONFIGURAZIONE** che appare (firebaseConfig)

8. Apri `js/firebase-config.js` nel progetto
9. **Sostituisci** tutti i valori `YOUR_*` con i valori della tua configurazione Firebase

Esempio:
```javascript
const firebaseConfig = {
    apiKey: "AIzaSyC...",
    authDomain: "apheron-io.firebaseapp.com",
    projectId: "apheron-io",
    storageBucket: "apheron-io.appspot.com",
    messagingSenderId: "123456789",
    appId: "1:123456789:web:abcdef"
};
```

---

## 🧪 PASSO 8: Test Locale (Opzionale ma Consigliato)

1. Nel terminale, nella cartella `functions`:
   ```bash
   cd functions
   npm run serve
   ```

2. In un altro terminale, testa la funzione:
   ```bash
   curl -X POST http://localhost:5001/YOUR_PROJECT_ID/us-central1/sendAppointmentRequest \
     -H "Content-Type: application/json" \
     -d '{"nome":"Test","email":"test@test.com","telefono":"123456789","tipologia":"consulenza-fiscale","messaggio":"Test","preferenzaContatto":"email","clientType":"new"}'
   ```

3. Controlla che l'email arrivi a `francesco.perone00@gmail.com`

---

## 🚀 PASSO 9: Deploy della Function

1. Torna alla root del progetto:
   ```bash
   cd ..
   ```

2. Deploy della funzione:
   ```bash
   firebase deploy --only functions
   ```

3. Attendi il completamento (può richiedere alcuni minuti)

4. Firebase ti mostrerà l'URL della funzione (non serve per il nostro uso, ma utile per debug)

---

## ✅ PASSO 10: Verifica Setup

1. Apri il sito in locale o dopo il deploy
2. Vai alla sezione **Contatti**
3. Compila il form come **"Nuovo Cliente"**
4. Invia una richiesta di test
5. Controlla la console browser (F12) per eventuali errori
6. Verifica che l'email arrivi a `francesco.perone00@gmail.com`

---

## 🔍 PASSO 11: Monitorare i Logs

1. Per vedere i logs delle funzioni:
   ```bash
   firebase functions:log
   ```

2. Oppure vai su [Firebase Console](https://console.firebase.google.com/) → **Functions** → **Logs**

---

## ⚠️ TROUBLESHOOTING

### Errore: "Function not found"
- Verifica che la funzione sia stata deployata: `firebase functions:list`
- Controlla che il nome della funzione in `js/main.js` corrisponda a quello in `functions/index.js`

### Errore: "Firebase non è inizializzato"
- Verifica che `firebase-config.js` sia caricato prima di `main.js` in `index.html`
- Controlla che i valori in `firebase-config.js` siano corretti
- Apri la console browser (F12) per vedere errori specifici

### Email non arrivano
- Controlla i logs Firebase: `firebase functions:log`
- Verifica che le credenziali Gmail siano corrette
- Assicurati di usare una App Password, non la password normale
- Controlla lo spam in `francesco.perone00@gmail.com`

### Errore: "CORS policy"
- La funzione include già CORS
- Se persiste, verifica che `cors` sia installato: `npm install cors` nella cartella `functions`

### Errore: "Module not found"
- Assicurati di aver fatto `npm install` nella cartella `functions`
- Verifica che `package.json` contenga tutte le dipendenze

---

## 📝 NOTE IMPORTANTI

1. **Sicurezza**: Le credenziali email sono salvate in modo sicuro in Firebase Functions Config
2. **Limiti**: Firebase Functions free tier include 2M invocazioni/mese
3. **Costi**: Generoso free tier, poi ~$0.40 per milione di invocazioni
4. **Gmail Limits**: Gmail ha limite di 500 email/giorno con account normale
5. **Reply-To**: Le email hanno `replyTo` impostato all'email del cliente, così puoi rispondere direttamente

---

## 🔄 AGGIORNAMENTI FUTURI

Se modifichi `functions/index.js`:

1. Testa localmente (opzionale):
   ```bash
   cd functions
   npm run serve
   ```

2. Deploy:
   ```bash
   cd ..
   firebase deploy --only functions
   ```

---

## ✅ CHECKLIST FINALE

- [ ] Firebase CLI installato e loggato
- [ ] Dipendenze Functions installate (`npm install` in `functions/`)
- [ ] Firebase Functions inizializzate (`firebase init functions`)
- [ ] Gmail App Password generata
- [ ] Credenziali configurate (`firebase functions:config:set`)
- [ ] `firebase-config.js` compilato con valori corretti
- [ ] Function deployata (`firebase deploy --only functions`)
- [ ] Test invio email completato
- [ ] Email ricevuta a `francesco.perone00@gmail.com`

---

## 📚 RISORSE UTILI

- [Firebase Functions Docs](https://firebase.google.com/docs/functions)
- [Nodemailer Docs](https://nodemailer.com/about/)
- [Gmail App Passwords](https://support.google.com/accounts/answer/185833)

---

Una volta completato, tutte le richieste di contatto verranno inviate automaticamente tramite Firebase Cloud Functions! 🎉

