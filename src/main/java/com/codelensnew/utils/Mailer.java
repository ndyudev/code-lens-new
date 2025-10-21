package com.codelensnew.utils;

import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message.RecipientType;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class Mailer {

    public static int send(String from, String to, String subject, String body) {
        // Thông số kết nối GMail
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        
        // Đăng nhập GMail
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                String username = "chauunhatduyyit@gmail.com";
                String password = "your_app_password_here"; // Cần thay bằng App Password
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {
            // Tạo mail
            MimeMessage mail = new MimeMessage(session);
            mail.setFrom(new InternetAddress(from));
            mail.setRecipients(RecipientType.TO, to);
            mail.setSubject(subject, "utf-8");
            mail.setText(body, "utf-8", "html");
            mail.setReplyTo(mail.getFrom());
            
            // Gửi mail
            Transport.send(mail);
            return 1; // Thành công
        } catch (Exception e) {
            // Silent fail
            return -1; // Lỗi
        }
    }
    
    /**
     * Gửi email newsletter cho danh sách subscribers
     */
    public static int sendNewsletter(String from, String[] toList, String subject, String body) {
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                String username = "chauunhatduyyit@gmail.com";
                String password = "your_app_password_here"; // Cần thay bằng App Password
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {
            MimeMessage mail = new MimeMessage(session);
            mail.setFrom(new InternetAddress(from));
            
            // Thêm tất cả recipients
            for (String to : toList) {
                mail.addRecipients(RecipientType.BCC, to);
            }
            
            mail.setSubject(subject, "utf-8");
            mail.setText(body, "utf-8", "html");
            mail.setReplyTo(mail.getFrom());
            
            Transport.send(mail);
            return 1; // Thành công
        } catch (Exception e) {
            // Silent fail
            return -1; // Lỗi
        }
    }
}
