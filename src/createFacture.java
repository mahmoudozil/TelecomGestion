
import cx.connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import Class.Employe;

public class createFacture extends HttpServlet {

    public void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {

        req.setAttribute("error_creation","");
        req.setAttribute("success_creation","");

        int numFac = Integer.parseInt(req.getParameter("numFac"));
        int numLine = Integer.parseInt(req.getParameter("numLine"));
        int month = Integer.parseInt(req.getParameter("month"));
        int year = Integer.parseInt(req.getParameter("year"));
        int NbrU = Integer.parseInt(req.getParameter("numU"));
        System.out.println(NbrU);
        int day = Integer.parseInt(req.getParameter("day"));
        day = day +3 ;
        String Date = day+"/"+month+"/"+year; //now + 3 days
        float costSrv1 =0;
        float costSrv2 =0;
        float Total = 0;
        boolean test = true;
        connection c = new connection();
        c.driver();
        c.OpenConnexion();
        ResultSet rs1= c.selectExec("select * from ligne");

        try {
            while (rs1.next()) {
                System.out.println(rs1.getString(1));
                if(rs1.getInt(1) == numLine)
                {
                        ResultSet rs = c.selectExec("select S1.cout,S2.cout from mobile M, service S1, service S2 where S1.numService=M.serviceInternet or S2.numService=M.serviceCommVocale");
                        try {
                            while (rs.next()) {
                                try {
                                    if (rs1.getString(3).equals("Mobile")) {
                                        test = false;
                                        costSrv1 = rs.getFloat(1);
                                        costSrv2 = rs.getFloat(2);

                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                        }

                }
            }
        }
        catch (Exception e) {System.out.println(e.getMessage());}
        if(test)
        {
            System.out.println(NbrU);
            System.out.println(Total);
            Total += 0.3 * NbrU;
            System.out.println(Total);
        }
        else
        {
            System.out.println(costSrv1);
            System.out.println(costSrv2);
            Total += (costSrv1 + costSrv2) * NbrU;
        }

        int Modified = 1;
        int ok = c.updateExec("insert into facture values ('"+numFac+"','"+numLine+"','"+month+"','"+year+"','"+NbrU+"','"+Date+"','"+Total+"','"+Modified+"');");
        if(ok==0)
        {
            req.setAttribute("error_creationf","error!!");
            req.setAttribute("pageToShow",5);
            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
        if(ok==1)
        {
            req.setAttribute("success_creationf","success!!");
            req.setAttribute("pageToShow",5);
            RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }


    }

}