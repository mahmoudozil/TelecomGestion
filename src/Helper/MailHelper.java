package Helper;


import java.io.File;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class MailHelper {

    private static String host;
    private static int port;
    private static String username;
    private static String password;

    public MailHelper() {
        try {
            File inputFile = new File("SMTPConfig.xml");
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser saxParser = factory.newSAXParser();
            XMLParser xmlParser = new XMLParser();
            saxParser.parse(inputFile, xmlParser);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendMail(String toMail,String Subject, String Content) {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from-email@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toMail));
            message.setSubject(Subject);
            message.setContent(Content,"text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Mail Sent Successfully");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void setHost(String host) {
        MailHelper.host = host;
    }

    public static void setPort(int port) {
        MailHelper.port = port;
    }

    public static void setUsername(String username) {
        MailHelper.username = username;
    }

    public static void setPassword(String password) {
        MailHelper.password = password;
    }
}