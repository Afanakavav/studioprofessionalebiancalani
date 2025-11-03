# ✅ Setup Completo - Quasi Automatico

Ho fatto **quasi tutto automaticamente** per te! Ecco cosa è stato completato e cosa devi fare manualmente.

---

## ✅ GIÀ FATTO AUTOMATICAMENTE

1. ✅ **Node.js verificato** (v22.20.0 installato)
2. ✅ **Firebase CLI verificato** (14.23.0 installato)
3. ✅ **Firebase login verificato** (sei loggato)
4. ✅ **Dipendenze Functions installate** (npm install completato)
5. ✅ **Firebase Functions inizializzato** (firebase.json presente)
6. ✅ **Codice Functions pronto** (index.js configurato)
7. ✅ **Frontend configurato** (main.js aggiornato per chiamare Functions)

---

## 📝 COSA DEVI FARE TU (Solo 2 cose!)

### 1. Configura Credenziali Email (5 minuti)

**Opzione A: File .env (Consigliato per locale e deploy)**

1. Nella cartella `functions`, crea un file `.env`:
   ```
   EMAIL_USER=francesco.perone00@gmail.com
   EMAIL_PASS=tua-app-password-16-caratteri
   ```

2. Per generare App Password Gmail:
   - Vai su [Google Account Security](https://myaccount.google.com/security)
   - Attiva "Verifica in due passaggi" se non attiva
   - Vai su "App passwords" → "Genera"
   - Seleziona: Mail → Other → "Firebase Functions"
   - **COPIA LA PASSWORD** (16 caratteri senza spazi)

**Opzione B: Firebase Config (Per deploy produzione)**

```bash
firebase functions:config:set email.user="francesco.perone00@gmail.com"
firebase functions:config:set email.password="tua-app-password"
```

> **Nota**: Firebase depreca `functions.config()` dopo marzo 2026. Il codice supporta entrambi, ma `.env` è più moderno.

---

### 2. Configura Firebase nel Frontend (2 minuti)

1. Vai su [Firebase Console](https://console.firebase.google.com/)
2. Seleziona progetto **apheron-homepage** (o quello che preferisci)
3. ⚙️ **Settings** → **Project settings**
4. Scorri a **"Your apps"** → Seleziona web app o **"Add app"** → Web (`</>`)
5. **COPIA** la configurazione che appare:

```javascript
const firebaseConfig = {
    apiKey: "AIzaSyC...",
    authDomain: "apheron-homepage.firebaseapp.com",
    projectId: "apheron-homepage",
    storageBucket: "apheron-homepage.appspot.com",
    messagingSenderId: "42831155917",
    appId: "1:42831155917:web:..."
};
```

6. **Apri** `js/firebase-config.js`
7. **Sostituisci** tutti i valori `YOUR_*` con quelli copiati

---

## 🧪 TEST LOCALE (Opzionale ma Consigliato)

1. Assicurati che `functions/.env` sia configurato
2. Apri terminale nella cartella `functions`:
   ```bash
   cd functions
   npm run serve
   ```

3. Apri il sito in un altro terminale con Live Server
4. Compila e invia il form
5. Controlla che l'email arrivi

---

## 🚀 DEPLOY

Quando tutto funziona in locale:

1. **Se usi .env**: Le variabili d'ambiente devono essere configurate anche in Firebase
2. **Deploy della funzione**:
   ```bash
   firebase deploy --only functions
   ```

3. **Verifica**: Il sito ora invierà email tramite Firebase Functions!

---

## 📊 STATO ATTUALE

| Componente | Stato |
|------------|-------|
| ✅ Node.js | Installato (v22.20.0) |
| ✅ Firebase CLI | Installato (14.23.0) |
| ✅ Firebase Login | ✅ Loggato |
| ✅ Dipendenze | ✅ Installate |
| ✅ Firebase Functions | ✅ Inizializzate |
| ✅ Codice Functions | ✅ Pronto |
| ✅ Frontend JS | ✅ Configurato |
| ⏳ Credenziali Email | ⚠️ Da configurare (tu) |
| ⏳ Firebase Config | ⚠️ Da configurare (tu) |

---

## 🎯 PROSSIMI PASSI

1. ✅ Crea `functions/.env` con credenziali Gmail
2. ✅ Configura `js/firebase-config.js` con valori Firebase Console
3. 🧪 (Opzionale) Testa localmente
4. 🚀 Deploy: `firebase deploy --only functions`

---

## ⚡ COMANDI RAPIDI

```bash
# Test locale
cd functions
npm run serve

# Deploy (dalla root)
firebase deploy --only functions

# Verifica credenziali configurate
firebase functions:config:get

# Logs dopo deploy
firebase functions:log
```

---

**Quasi tutto è pronto!** Devi solo configurare le 2 cose sopra e sei a posto! 🎉

