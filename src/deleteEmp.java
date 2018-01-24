
import cx.connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import Class.Employe;

public class deleteEmp extends HttpServlet {

    public void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {
        RequestDispatcher rd=req.getRequestDispatcher("/createEmp.jsp");
        rd.include(req, res);
    }
    public void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {

        int cin = Integer.parseInt(req.getParameter("idEmp"));
        System.out.println(cin);
        connection c = new connection();
        c.driver();
        c.OpenConnexion();

        int ok = c.updateExec("delete from employees where cin LIKE '"+cin+"';");
        System.out.println(ok);
        if(ok==0)
        {
            req.setAttribute("error_creation","can't insert");
            req.setAttribute("pageToShow",1);

            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
        if(ok==1)
        {
            req.setAttribute("success_creation","DONE!!");
            req.setAttribute("pageToShow",1);

            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
    }

}