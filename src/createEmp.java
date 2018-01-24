
import cx.connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import Class.Employe;

public class createEmp extends HttpServlet {

    public void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {
        req.setAttribute("error_creationEmp","");
        req.setAttribute("success_creationEmp","");
        int cin = Integer.parseInt(req.getParameter("cin"));
        String name = (String) req.getParameter("name");
        String email = (String) req.getParameter("email");
        System.out.println(email);
        String pass = (String) req.getParameter("pass");
        String role = (String) req.getParameter("role");
        Employe e = new Employe(cin,name,email,pass,role);
        connection c = new connection();
        c.driver();
        c.OpenConnexion();

        int ok = c.updateExec("insert into employees values ('"+cin+"','"+name+"','"+email+"','"+pass+"','"+role+"');");
        System.out.println(ok);
        if(ok==0)
        {
            req.setAttribute("error_creationEmp","error!!");
            req.setAttribute("pageToShow",1);
            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
        if(ok==1)
        {
            req.setAttribute("success_creationEmp","success!!");
            req.setAttribute("pageToShow",1);

            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
    }

}