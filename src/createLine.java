
import cx.connection;
import Class.Mobile;
import  Class.Fixe;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.sound.sampled.Line;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        int ok;

        if(locGeo.length() == 0)
        {

            ResultSet rs = c.selectExec("select COUNT(*) from mobile");
            try {
                rs.next();
                System.out.println(rs.getInt(1));
                ResultSet rs1 = c.selectExec("select maxMobile from aprobation");
                try {
                    rs.next();
                    if(rs.getInt(1)>rs1.getInt(1))
                    {
                        req.setAttribute("error_creationLine","can't insert more!!");
                        req.setAttribute("pageToShow",4);
                        RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
                        rd.include(req, res);
                    }
                }
                catch (Exception e) {e.printStackTrace();}
            } catch (SQLException e) {
                e.printStackTrace();
            }
            new Mobile(numLigne,idAbn,typeMobile,reseau,serviceInternet,serviceCommvocale);
            ok = c.updateExec("insert into ligne values ('"+numLigne+"','"+idAbn+"','"+type+"');");
            int ok1 = c.updateExec("insert into mobile values ('"+numLigne+"','"+typeMobile+"','"+reseau+"','"+serviceInternet+"','"+serviceCommvocale+"');");

        }
        else
        {
            ResultSet rs3 = c.selectExec("select COUNT(*) from fixe");
            try {
                rs3.next();
                ResultSet rs2 = c.selectExec("select maxFixe from aprobation");
                try {
                    rs2.next();
                    if(rs3.getInt(1)>rs2.getInt(1))
                    {
                        req.setAttribute("error_creationLine","can't insert more!!");
                        req.setAttribute("pageToShow",4);
                        RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
                        rd.include(req, res);
                    }
                }
                catch (Exception e) {e.printStackTrace();}
            } catch (SQLException e) {
                e.printStackTrace();
            }
            new Fixe(numLigne,idAbn,locGeo);
            ok = c.updateExec("insert into ligne values ('"+numLigne+"','"+idAbn+"','"+type+"');");
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