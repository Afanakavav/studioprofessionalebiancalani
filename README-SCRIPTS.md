# 🤖 Script Automatici - Studio Biancalani

Script per automatizzare il setup e il deploy di Firebase Functions.

---

## 📁 File Script Disponibili

### 🚀 `setup-firebase-functions.bat` (Windows) / `.sh` (Mac/Linux)
**Cosa fa:**
- ✅ Verifica Node.js e Firebase CLI (li installa se mancanti)
- ✅ Verifica login Firebase (avvia login se necessario)
- ✅ Installa/aggiorna dipendenze Functions
- ✅ Inizializza Firebase Functions se necessario
- ✅ Chiede credenziali email e le configura automaticamente

**Come usare:**
- **Windows**: Doppio click su `setup-firebase-functions.bat`
- **Mac/Linux**: 
  ```bash
  chmod +x setup-firebase-functions.sh
  ./setup-firebase-functions.sh
  ```

---

### 🚀 `deploy-function.bat` (Windows)
**Cosa fa:**
- ✅ Verifica login Firebase
- ✅ Verifica credenziali configurate
- ✅ Mostra configurazione attuale
- ✅ Esegue deploy della funzione

**Come usare:**
- Doppio click su `deploy-function.bat`
- Oppure: `firebase deploy --only functions`

---

### 🧪 `test-function.bat` (Windows)
**Cosa fa:**
- ✅ Avvia emulatore Firebase Functions locale
- ✅ Permette test locale prima del deploy

**Come usare:**
1. Naviga nella cartella `functions`
2. Doppio click su `test-function.bat`
3. Oppure: `npm run serve`

---

## 📝 Passi Manuali Necessari

Anche con gli script, devi fare manualmente:

1. **Genera Gmail App Password** (vedi `SETUP-RAPIDO.md`)
2. **Configura `js/firebase-config.js`** con valori Firebase Console
3. **Testa e deploy** quando tutto è pronto

---

## 🔄 Workflow Completo

### Prima Volta:
1. ✅ Esegui `setup-firebase-functions.bat`
2. ✅ Inserisci credenziali quando richieste
3. ✅ Configura manualmente `js/firebase-config.js`
4. 🧪 (Opzionale) Testa con `test-function.bat`
5. 🚀 Deploy con `deploy-function.bat`

### Dopo Modifiche al Codice:
1. 🚀 Esegui `deploy-function.bat` per aggiornare

### Dopo Modifiche alle Credenziali:
1. ✅ Esegui di nuovo `setup-firebase-functions.bat` (solo parte credenziali)

---

## ⚠️ Note Importanti

- Gli script verificano automaticamente dipendenze e login
- Se qualcosa va storto, vedi `SETUP-FIREBASE-FUNCTIONS.md` per debug
- Gli script sono sicuri: non modificano file esistenti, solo configurano

---

## 🆘 Problemi?

Se gli script non funzionano:
1. Verifica Node.js: `node --version`
2. Verifica Firebase CLI: `firebase --version`
3. Esegui manualmente i comandi (vedi `SETUP-FIREBASE-FUNCTIONS.md`)

