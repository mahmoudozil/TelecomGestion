
import cx.connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import Class.Employe;

public class createEmp extends HttpServlet {
    public void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {
        RequestDispatcher rd=req.getRequestDispatcher("/createEmp.jsp");
        rd.include(req, res);
    }

    public void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        req.setAttribute("error_creation","");
        req.setAttribute("success_creation","");
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
        String sql = "insert into employees values (" + cin + "," + "'.name.'" + "," + "email" + "," + "pass" + "," + "role" + ")";
        System.out.println(sql);
        int ok = c.updateExec(sql);
        System.out.println(ok);
        if(ok==0)
        {
            req.setAttribute("error_creation","can't insert");
            RequestDispatcher rd=req.getRequestDispatcher("/createEmp.jsp");
            rd.include(req, res);
        }
        if(ok==1)
        {
            req.setAttribute("success_creation","DONE!!");
            RequestDispatcher rd=req.getRequestDispatcher("/createEmp.jsp");
            rd.include(req, res);
        }
    }

}