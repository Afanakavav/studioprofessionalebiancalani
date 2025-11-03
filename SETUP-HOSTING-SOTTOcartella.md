# 🎯 Setup Hosting: Studio Biancalani come Sottocartella

**Soluzione Consigliata: Nuovo Site Firebase (Multi-Site Hosting)**

Questa è la soluzione migliore: crea un nuovo site nello stesso progetto Firebase, senza toccare apheron-homepage.

---

## 📋 **PASSO 1: Crea Nuovo Site in Firebase Console**

1. Vai su [Firebase Console](https://console.firebase.google.com/)
2. Seleziona progetto **apheron-homepage**
3. Vai su **Hosting** nel menu laterale
4. Se vedi "Add another site" o "Add site", clicca
5. Se non vedi questa opzione, clicca sulla freccia accanto al site esistente → "Add site"
6. Inserisci:
   - **Site ID**: `studioprofessionalebiancalani` (o `apheron-homepage--studioprofessionalebiancalani` se Firebase lo genera automaticamente)
   - Firebase ti darà un URL tipo: `apheron-homepage--studioprofessionalebiancalani.web.app`
7. Clicca **"Create site"**
8. **COPIA il Site ID** esatto che Firebase ti ha dato

---

## 🔧 **PASSO 2: Configura il Progetto Locale**

### 2.1: Crea file `.firebaserc` con target hosting

Il file `.firebaserc` dovrebbe essere così:

```json
{
  "projects": {
    "default": "apheron-homepage"
  },
  "targets": {
    "apheron-homepage": {
      "hosting": {
        "studioprofessionalebiancalani": [
          "apheron-homepage--studioprofessionalebiancalani"
        ]
      }
    }
  }
}
```

**Sostituisci** `apheron-homepage--studioprofessionalebiancalani` con il **Site ID esatto** che hai copiato dal Console.

### 2.2: Configura `firebase.json`

Il `firebase.json` è già configurato correttamente. Verifica che la sezione `hosting` sia presente (già fatto automaticamente).

---

## 🚀 **PASSO 3: Deploy**

### Deploy Functions + Hosting insieme:

```bash
firebase deploy --only functions,hosting:studioprofessionalebiancalani
```

Oppure deploy separati:

```bash
# Solo Functions
firebase deploy --only functions

# Solo Hosting (sul nuovo site)
firebase deploy --only hosting:studioprofessionalebiancalani
```

---

## 🌐 **PASSO 4: Configura URL Sottocartella (Opzionale)**

Se vuoi che sia accessibile come `apheron.io/studioprofessionalebiancalani` invece dell'URL default:

### Opzione A: Rewrites nel firebase.json di apheron-homepage (richiede modifica)

1. Vai nella cartella `apheron-homepage`
2. Apri `firebase.json`
3. Aggiungi rewrites:

```json
{
  "hosting": {
    "public": "public",
    "rewrites": [
      {
        "source": "/studioprofessionalebiancalani/**",
        "destination": "https://apheron-homepage--studioprofessionalebiancalani.web.app/**"
      },
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

4. Deploy apheron-homepage

### Opzione B: Dominio Custom (più professionale)

1. In Firebase Console → Hosting → Site `studioprofessionalebiancalani`
2. Aggiungi dominio custom: `studioprofessionalebiancalani.apheron.io`
3. Configura DNS come indicato

---

## ✅ **VERIFICA**

Dopo il deploy:

1. **URL Default**: `https://apheron-homepage--studioprofessionalebiancalani.web.app`
2. Oppure se configurato: `https://apheron.io/studioprofessionalebiancalani`

Apri l'URL e verifica che tutto funzioni!

---

## 🔄 **AGGIORNAMENTI FUTURI**

Quando modifichi Studio Biancalani:

```bash
firebase deploy --only hosting:studioprofessionalebiancalani
```

Il sito apheron-homepage **NON verrà toccato**!

---

## ⚠️ **IMPORTANTE**

- ✅ Il progetto apheron-homepage rimane **completamente intatto**
- ✅ Puoi deployare Studio Biancalani indipendentemente
- ✅ Le Functions sono condivise tra i due sites (stesso progetto Firebase)
- ✅ Se qualcosa va storto, non impatta apheron-homepage

---

## 🆘 **PROBLEMI?**

### "Site not found"
- Verifica che il Site ID in `.firebaserc` corrisponda esattamente a quello del Console
- Controlla di essere nel progetto giusto: `firebase use apheron-homepage`

### "Permission denied"
- Verifica di avere i permessi sul progetto Firebase
- Controlla che il site sia stato creato correttamente

### Deploy va sul sito sbagliato
- Verifica `.firebaserc` ha il target corretto
- Usa: `firebase deploy --only hosting:studioprofessionalebiancalani`

---

**Questa è la soluzione più sicura e professionale!** 🎯

