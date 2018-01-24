
import cx.connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import Class.Employe;

public class createSrv extends HttpServlet {

    public void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {

        req.setAttribute("error_creationSrv","");
        req.setAttribute("success_creationSrv","");
        int id = Integer.parseInt(req.getParameter("id"));
        String des = (String) req.getParameter("des");
        float cost = Float.parseFloat(req.getParameter("cost"));
        String type = (String) req.getParameter("type");
        String isp = (String) req.getParameter("isp");
        connection c = new connection();
        c.driver();
        c.OpenConnexion();

        int ok = c.updateExec("insert into service values ('"+id+"','"+des+"','"+cost+"','"+type+"');");
        System.out.println(ok);

        if(isp.length() == 0)
        {
            int ok1 = c.updateExec("insert into commVocale values ('"+id+"');");

        }
        else
        {
            int ok2 = c.updateExec("insert into internet values ('"+id+"','"+isp+"');");

        }
        if(ok==0)
        {
            req.setAttribute("error_creationSrv","error!!");
            req.setAttribute("pageToShow",3);

            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
        if(ok==1)
        {
            req.setAttribute("success_creationSrv","success!!");
            req.setAttribute("pageToShow",3);

            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
    }

}