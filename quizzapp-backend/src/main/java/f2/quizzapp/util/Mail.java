package f2.quizzapp.util;

import ch.qos.logback.classic.Logger;
import jakarta.mail.*;
import jakarta.mail.Message.RecipientType;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

@Service
public class Mail {
    private static final Properties props = new Properties();
    private static String EMAIL;
    private static String KEY;
    private static Session session;

    private final Logger loggerUser;

    @Autowired
    public Mail(Logger loggerUser) {
        this.loggerUser = loggerUser;
        Properties p = getProperties();
        props.put("mail.smtp.host", p.getProperty("mail.smtp.host"));
        props.put("mail.smtp.port", p.getProperty("mail.smtp.port"));
        props.put("mail.smtp.ssl.enable", p.getProperty("mail.smtp.ssl.enable"));
        props.put("mail.smtp.auth", p.getProperty("mail.smtp.auth"));
        EMAIL = p.getProperty("mail.email");
        KEY = p.getProperty("mail.authCode");
        Authenticator authenticator = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Mail.EMAIL, Mail.KEY);
            }
        };
        session = Session.getInstance(props, authenticator);
    }

    public void sendMail(String recipient, String body) {
        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(EMAIL));
            msg.setRecipient(RecipientType.TO, new InternetAddress(recipient));
            msg.setSubject("Quizzapp");
            MimeBodyPart bpText = new MimeBodyPart();
            bpText.setContent(body, "text/plain");
            MimeMultipart mp = new MimeMultipart();
            mp.addBodyPart(bpText);
            msg.setContent(mp);
            Transport.send(msg);
        } catch (MessagingException e) {
            loggerUser.error(e.toString());
        }
    }

    public Properties getProperties() {
        Properties prop = new Properties();
        try (InputStream input = new FileInputStream("resources/config.properties")) {
            prop.load(input);
            return prop;
        } catch (IOException e) {
            loggerUser.error(e.toString());
            return null;
        }
    }
}