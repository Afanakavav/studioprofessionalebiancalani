const functions = require('firebase-functions');
const nodemailer = require('nodemailer');
const cors = require('cors')({ origin: true });

// Configurazione email SMTP (Gmail)
// Le credenziali vengono da:
// 1. Firebase Secrets (produzione - metodo moderno, richiede Blaze)
// 2. Firebase Config (produzione - metodo legacy, funziona sempre con Blaze)
// 3. .env file (locale per test)
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        // Priorità: Secrets/Config Firebase > .env locale
        user: process.env.EMAIL_USER || functions.config().email?.user,
        pass: process.env.EMAIL_PASS || functions.config().email?.password,
    },
});

/**
 * Cloud Function per inviare email di richiesta appuntamento
 */
exports.sendAppointmentRequest = functions.https.onRequest((req, res) => {
    // Abilita CORS
    cors(req, res, () => {
        // Verifica che sia una richiesta POST
        if (req.method !== 'POST') {
            return res.status(405).json({ error: 'Method not allowed' });
        }

        // Estrai i dati dal body
        const {
            nome,
            email,
            telefono,
            partitaIva,
            tipologia,
            messaggio,
            preferenzaContatto,
            clientType,
        } = req.body;

        // Validazione base
        if (!nome || !email || !telefono || !tipologia || !messaggio) {
            return res.status(400).json({ 
                error: 'Dati mancanti. Verifica che tutti i campi obbligatori siano compilati.' 
            });
        }

        // Determina il tipo di cliente
        const tipoCliente = clientType === 'new' ? 'Nuovo Cliente' : 'Cliente Esistente';
        
        // Formatta la data
        const dataRichiesta = new Date().toLocaleString('it-IT', {
            day: '2-digit',
            month: '2-digit',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit',
        });

        // Crea il testo dell'email
        let emailText = `
Richiesta di Appuntamento - ${tipoCliente}

DETTAGLI CLIENTE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Nome: ${nome}
Email: ${email}
Telefono: ${telefono}
${partitaIva ? `Partita IVA: ${partitaIva}` : ''}

RICHIESTA:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Tipologia: ${tipologia}
Preferenza Contatto: ${preferenzaContatto}

MESSAGGIO:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
${messaggio}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Data richiesta: ${dataRichiesta}
Inviato da: ${email}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Questa email è stata inviata automaticamente dal sito web
Studio Professionale Biancalani
www.apheron.io/studioprofessionalebiancalani
        `.trim();

        // Crea l'HTML dell'email
        let emailHtml = `
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .header { background-color: #003366; color: white; padding: 20px; text-align: center; }
        .content { background-color: #f9f9f9; padding: 20px; margin-top: 20px; }
        .section { margin-bottom: 20px; }
        .section-title { font-weight: bold; color: #003366; margin-bottom: 10px; font-size: 16px; }
        .field { margin-bottom: 8px; }
        .field-label { font-weight: bold; }
        .message-box { background-color: white; padding: 15px; border-left: 4px solid #0066CC; margin-top: 10px; }
        .footer { margin-top: 30px; padding-top: 20px; border-top: 1px solid #ddd; font-size: 12px; color: #666; text-align: center; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2 style="margin: 0;">Richiesta di Appuntamento</h2>
            <p style="margin: 10px 0 0 0; font-size: 14px;">${tipoCliente}</p>
        </div>
        
        <div class="content">
            <div class="section">
                <div class="section-title">Dettagli Cliente</div>
                <div class="field">
                    <span class="field-label">Nome:</span> ${nome}
                </div>
                <div class="field">
                    <span class="field-label">Email:</span> <a href="mailto:${email}">${email}</a>
                </div>
                <div class="field">
                    <span class="field-label">Telefono:</span> <a href="tel:${telefono}">${telefono}</a>
                </div>
                ${partitaIva ? `<div class="field"><span class="field-label">Partita IVA:</span> ${partitaIva}</div>` : ''}
            </div>
            
            <div class="section">
                <div class="section-title">Richiesta</div>
                <div class="field">
                    <span class="field-label">Tipologia:</span> ${tipologia}
                </div>
                <div class="field">
                    <span class="field-label">Preferenza Contatto:</span> ${preferenzaContatto}
                </div>
            </div>
            
            <div class="section">
                <div class="section-title">Messaggio</div>
                <div class="message-box">
                    ${messaggio.replace(/\n/g, '<br>')}
                </div>
            </div>
        </div>
        
        <div class="footer">
            <p style="margin: 0;">Data richiesta: ${dataRichiesta}</p>
            <p style="margin: 5px 0 0 0;">
                Questa email è stata inviata automaticamente dal sito web<br>
                <strong>Studio Professionale Biancalani</strong><br>
                <a href="https://apheron.io/studioprofessionalebiancalani" style="color: #0066CC;">www.apheron.io/studioprofessionalebiancalani</a>
            </p>
        </div>
    </div>
</body>
</html>
        `.trim();

        // Configurazione email
        const mailOptions = {
            from: `"Sito Web Studio Biancalani" <${process.env.EMAIL_USER || functions.config().email?.user}>`,
            to: 'francesco.perone00@gmail.com',
            replyTo: email, // Permette di rispondere direttamente al cliente
            subject: `Richiesta Appuntamento - ${tipoCliente} - ${nome}`,
            text: emailText,
            html: emailHtml,
        };

        // Invia email
        transporter.sendMail(mailOptions)
            .then(() => {
                console.log('Email inviata con successo a francesco.perone00@gmail.com');
                return res.status(200).json({ 
                    success: true, 
                    message: 'Email inviata con successo' 
                });
            })
            .catch((error) => {
                console.error('Errore nell\'invio email:', error);
                return res.status(500).json({ 
                    error: 'Errore nell\'invio dell\'email', 
                    details: error.message 
                });
            });
    });
});

