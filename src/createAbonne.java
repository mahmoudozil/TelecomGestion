
import cx.connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import Class.Employe;

public class createAbonne extends HttpServlet {

    public void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {

        req.setAttribute("error_creationAbn","");
        req.setAttribute("success_creationAbn","");
        int mat = Integer.parseInt(req.getParameter("matAbn"));
        String lname = (String) req.getParameter("lname");
        String fname = (String) req.getParameter("fname");
        String address = (String) req.getParameter("add");
        String email = (String) req.getParameter("email");

        connection c = new connection();
        c.driver();
        c.OpenConnexion();

        int ok = c.updateExec("insert into abonne values ('"+mat+"','"+lname+"','"+fname+"','"+address+"','"+email+"');");
        System.out.println(ok);
        if(ok==0)
        {
            req.setAttribute("error_creationAbn","error!!");
            req.setAttribute("pageToShow",2);

            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
        if(ok==1)
        {
            req.setAttribute("success_creationAbn","success!!");
            req.setAttribute("pageToShow",2);

            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
    }

}