
import cx.connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import Class.Employe;

public class createLine extends HttpServlet {

    public void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {

        req.setAttribute("error_creationLine","");
        req.setAttribute("success_creationLine","");

        int numLigne = Integer.parseInt(req.getParameter("id"));
        int idAbn = Integer.parseInt(req.getParameter("idAbn"));

        String type = (String) req.getParameter("type");

        String locGeo =  (String) req.getParameter("locGeo");

        String typeMobile =  (String) req.getParameter("typeMobile");
        String reseau =  (String) req.getParameter("reseau");

        String serviceInternet =  (String) req.getParameter("serviceInternet");
        String serviceCommvocale =  (String) req.getParameter("serviceCommVocale");

        connection c = new connection();
        c.driver();
        c.OpenConnexion();

        int ok = c.updateExec("insert into ligne values ('"+numLigne+"','"+idAbn+"','"+type+"');");
        System.out.println(ok);

        if(locGeo.length() == 0)
        {
            int ok1 = c.updateExec("insert into mobile values ('"+numLigne+"','"+typeMobile+"','"+reseau+"','"+serviceInternet+"','"+serviceCommvocale+"');");

        }
        else
        {
            int ok2 = c.updateExec("insert into fixe values ('"+numLigne+"','"+locGeo+"');");

        }

        if(ok==0)
        {
            req.setAttribute("error_creationLine","error!!");
            req.setAttribute("pageToShow",4);
            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
        if(ok==1)
        {
            req.setAttribute("pageToShow",4);
            req.setAttribute("success_creationLine","success!!");
            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
    }

}