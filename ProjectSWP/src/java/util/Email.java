/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 * A utility class for sending e-mail messages
 *
 * @author www.codejava.net
 *
 */
public class Email {
    private final String from = "thaitung3888@gmail.com";
    private final String password = "pehslnxptrwnjgpc";
    
    public void sendMail(String emailTo, String titleMail, String body) {
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587");
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });
        MimeMessage mimeMessage = new MimeMessage(session);
        try {
            mimeMessage.setFrom(new InternetAddress("email"));
            mimeMessage.setRecipients(Message.RecipientType.TO, emailTo);
            mimeMessage.setSubject(titleMail, "utf-8");
            mimeMessage.setContent(body, "text/html; charset=UTF-8");
            mimeMessage.setReplyTo(mimeMessage.getFrom());
            Transport.send(mimeMessage);
        } catch (Exception ex) {
        }
    }
}
