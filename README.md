# Studio Professionale Biancalani - Sito Web

Sito web moderno e professionale per lo Studio Professionale Biancalani, Dottori Commercialisti e Revisori Legali a Prato.

## 📋 Caratteristiche

- **Design Moderno**: Layout responsive e user-friendly
- **Colori Originali**: Mantiene la palette di colori del sito originale
- **Sezioni Complete**:
  - Homepage con hero section
  - Lo Studio (storia e certificazioni)
  - I Professionisti (team completo)
  - Servizi (Aree di Attività)
  - ACB Group (partnership)
  - Contatti (form per appuntamenti)
  - Dove Siamo (mappa interattiva)
- **Form di Contatto**: Sistema di prenotazione appuntamenti per nuovi clienti e clienti esistenti
- **Nessuna Area Riservata**: Rimossa come richiesto

## 🚀 Installazione e Setup

1. Clona o scarica il progetto
2. Non richiede installazione - è un sito statico HTML/CSS/JS
3. Apri `index.html` nel browser per visualizzare

## 📁 Struttura Progetto

```
studiobiancalani-website/
├── index.html          # Pagina principale
├── css/
│   └── styles.css      # Stili CSS
├── js/
│   ├── main.js        # JavaScript principale
│   └── data.js        # Dati (professionisti, servizi, ecc.)
├── images/            # Immagini del sito
│   ├── professionisti/
│   ├── acb/
│   └── placeholder-person.jpg
└── README.md
```

## 🎨 Personalizzazione

### Modificare i Professionisti
Modifica l'array `professionisti` in `js/data.js`

### Modificare i Servizi
Modifica l'array `servizi` in `js/data.js`

### Modificare i Colori
Modifica le variabili CSS in `css/styles.css`:
```css
:root {
    --color-primary: #003366;      /* Blu scuro */
    --color-secondary: #0066CC;    /* Blu chiaro */
    --color-accent: #FF6600;       /* Arancione */
    ...
}
```

## 📧 Configurazione Form Contatti

Il form di contatto attualmente invia i dati tramite console.log. Per implementare l'invio email:

1. **Opzione 1: EmailJS** (consigliato per siti statici)
   - Registrati su [EmailJS](https://www.emailjs.com/)
   - Configura un template email
   - Aggiungi lo script in `index.html`:
   ```html
   <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
   ```
   - Modifica la funzione `sendFormData()` in `js/main.js`

2. **Opzione 2: Backend API**
   - Crea un endpoint API sul tuo server
   - Modifica la funzione `sendFormData()` per inviare a `/api/appointments`

## 🌐 Deploy

Il sito è statico e può essere deployato su:
- **Netlify**: Trascina la cartella nel dashboard
- **Vercel**: `vercel deploy`
- **GitHub Pages**: Push su repository GitHub e abilita Pages
- **Server tradizionale**: Carica tutti i file via FTP

## 📱 Responsive Design

Il sito è completamente responsive e ottimizzato per:
- Desktop (1200px+)
- Tablet (768px - 1199px)
- Mobile (fino a 767px)

## ✨ Funzionalità Aggiuntive Consigliate

1. **Calendario Prenotazioni Online**
   - Integrazione con Calendly o simile
   - Permettere selezione data/ora direttamente dal form

2. **Newsletter**
   - Form per iscrizione newsletter
   - Invio aggiornamenti normativi e news

3. **Blog/News**
   - Sezione per aggiornamenti fiscali e normativi
   - Notizie dello studio

4. **Chat Live**
   - Integrazione chat widget (Tawk.to, Crisp, ecc.)
   - Supporto clienti in tempo reale

5. **Download Documenti**
   - Area download moduli e documenti utili
   - Guide fiscali e normative

6. **FAQ**
   - Sezione domande frequenti
   - Riduce richieste ricorrenti

7. **Testimonials**
   - Recensioni e testimonianze clienti
   - Aumenta la fiducia

8. **Social Media Integration**
   - Feed Facebook/LinkedIn
   - Condivisione social

## 🔧 Manutenzione

- Aggiorna regolarmente i contenuti
- Mantieni le immagini ottimizzate
- Monitora le performance del form contatti
- Testa su diversi browser e dispositivi

## 📞 Supporto

Per domande o supporto tecnico, contattare lo sviluppatore.

## 📄 Licenza

© 2025 Studio Professionale Biancalani - Tutti i diritti riservati

