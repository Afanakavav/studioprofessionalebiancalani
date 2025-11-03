# 📧 Setup EmailJS per Form Contatti

Questa guida ti aiuterà a configurare EmailJS per inviare email automatiche quando qualcuno compila il form di contatto.

## 🚀 Passo 1: Registrazione EmailJS

1. Vai su [EmailJS.com](https://www.emailjs.com/)
2. Clicca su "Sign Up" e crea un account gratuito
3. Completa la registrazione (verifica email)

## 📝 Passo 2: Aggiungi Email Service

1. Vai su **Email Services** nel dashboard
2. Clicca su **Add New Service**
3. Seleziona il tuo provider email:
   - **Gmail** (consigliato per facilità)
   - **Outlook**
   - **Altri servizi email**
4. Segui le istruzioni per connettere il tuo account email
5. Assegna un **Service ID** (es: "studio_biancalani")

## 📋 Passo 3: Crea Email Template

1. Vai su **Email Templates**
2. Clicca su **Create New Template**
3. Configura il template:

### Template per "Nuovo Cliente":
```
Oggetto: Nuova Richiesta Appuntamento - Nuovo Cliente

Messaggio:
Nuova richiesta di appuntamento ricevuta dal sito web.

Dettagli Cliente:
Nome: {{nome}}
Email: {{email}}
Telefono: {{telefono}}

Tipologia Richiesta: {{tipologia}}
Messaggio: {{messaggio}}

Preferenza Contatto: {{preferenzaContatto}}

---
Questa email è stata inviata automaticamente dal sito web.
Studio Professionale Biancalani
```

### Template per "Cliente Esistente":
```
Oggetto: Richiesta Appuntamento - Cliente Esistente

Messaggio:
Richiesta di appuntamento da cliente esistente.

Dettagli:
Nome: {{nome}}
Email: {{email}}
Telefono: {{telefono}}
Partita IVA: {{partitaIva}}

Tipologia Richiesta: {{tipologia}}
Messaggio: {{messaggio}}

Preferenza Contatto: {{preferenzaContatto}}

---
Questa email è stata inviata automaticamente dal sito web.
Studio Professionale Biancalani
```

4. Assegna un **Template ID** (es: "template_new_client" o "template_existing_client")
5. Salva il template

## 🔑 Passo 4: Ottieni le Chiavi API

1. Vai su **Account** → **General**
2. Copia il tuo **Public Key** (USER_ID)
3. Tieni pronte anche le chiavi Service ID e Template ID

## 💻 Passo 5: Integra nel Sito

### Aggiungi lo script EmailJS in `index.html`:

Aggiungi prima della chiusura del tag `</head>`:
```html
<!-- EmailJS -->
<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script>
    (function(){
        emailjs.init("TUO_PUBLIC_KEY"); // Sostituisci con il tuo Public Key
    })();
</script>
```

### Modifica `js/main.js`:

Sostituisci la funzione `sendFormData()` con:

```javascript
async function sendFormData(formData) {
    try {
        // Determina il template ID in base al tipo di cliente
        const templateId = formData.clientType === 'new' 
            ? 'template_new_client'  // Sostituisci con il tuo Template ID
            : 'template_existing_client'; // Sostituisci con il tuo Template ID
        
        const serviceId = 'studio_biancalani'; // Sostituisci con il tuo Service ID
        
        // Prepara i parametri per EmailJS
        const templateParams = {
            nome: formData.nome,
            email: formData.email,
            telefono: formData.telefono,
            partitaIva: formData.partitaIva || 'N/A',
            tipologia: formData.tipologia,
            messaggio: formData.messaggio,
            preferenzaContatto: formData.preferenzaContatto,
            dataRichiesta: new Date().toLocaleString('it-IT')
        };
        
        // Invia email
        const response = await emailjs.send(serviceId, templateId, templateParams);
        
        if (response.status === 200) {
            return { success: true };
        } else {
            throw new Error('Email non inviata');
        }
    } catch (error) {
        console.error('Error submitting form:', error);
        showFormError();
        throw error;
    }
}
```

## ✅ Passo 6: Test

1. Apri il sito in locale
2. Compila il form di contatto
3. Invia una richiesta di test
4. Controlla la tua casella email
5. Verifica che l'email sia arrivata correttamente

## 🔒 Sicurezza

- **Public Key è pubblica**: Va bene esporla nel frontend
- **Rate Limiting**: EmailJS free tier ha limiti (200 email/mese)
- **Validazione**: Il form valida già i dati lato client
- **HTTPS**: Usa sempre HTTPS in produzione

## 📊 Monitoraggio

1. Vai su **EmailJS Dashboard** → **Logs**
2. Vedi tutte le email inviate
3. Controlla errori o problemi

## 💡 Alternative

Se EmailJS non soddisfa le tue esigenze:

1. **Backend API**: Crea un endpoint sul tuo server
2. **Netlify Forms**: Se deployi su Netlify (gratuito)
3. **Formspree**: Alternativa a EmailJS
4. **Google Apps Script**: Se usi Google Workspace

## 🆘 Supporto

- EmailJS Docs: https://www.emailjs.com/docs/
- Problemi comuni: Controlla la console browser per errori
- Test: Usa sempre prima in ambiente di sviluppo

## ✅ Checklist Finale

- [ ] Account EmailJS creato
- [ ] Email service configurato
- [ ] Template email creati
- [ ] Public Key ottenuto
- [ ] Script EmailJS aggiunto in HTML
- [ ] Funzione sendFormData() aggiornata
- [ ] Test form inviato con successo
- [ ] Email ricevuta correttamente

Una volta completato, il form invierà automaticamente email quando qualcuno compila e invia una richiesta di appuntamento!

