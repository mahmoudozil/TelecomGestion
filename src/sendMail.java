
import Helper.MailHelper;
import cx.connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import Class.Employe;

public class sendMail extends HttpServlet {

    public void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException {

    String mail = req.getParameter("mail");
    String objet = req.getParameter("objet");
    String contenu = req.getParameter("contenu");

    new MailHelper().sendMail(mail,objet,contenu);
    req.setAttribute("successMail","Mail Sent!!");
    RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
    rd.include(req, res);
    }

    }
