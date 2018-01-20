
import cx.connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

public class login extends HttpServlet {
    public void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {

        String email = (String) req.getParameter("email");
        String pass = (String) req.getParameter("pass");
        connection c = new connection();
        c.driver();
        c.OpenConnexion();
        ResultSet rs= c.selectExec("select * from employees");
        boolean test = false;
        req.setAttribute("error","");
        try {
            while(rs.next()){
                if(rs.getString(3).equals(email))
                {
                    if(rs.getString(4).equals(pass))
                    {
                        HttpSession session = req.getSession(true);
                        session.setAttribute("cin",rs.getInt(1));
                        session.setAttribute("name",rs.getString(2));
                        session.setAttribute("email",rs.getString(3));
                        session.setAttribute("pass",rs.getString(4));
                        session.setAttribute("role",rs.getString(5));

                        RequestDispatcher rd=req.getRequestDispatcher("home");
                        rd.forward(req, res);
                    }
                    else
                    {
                        test = true;
                        req.setAttribute("error","Password Incorrect!");
                        RequestDispatcher rd=req.getRequestDispatcher("/index.jsp");
                        rd.include(req, res);
                    }
                }


            }
            if(!test) {

                req.setAttribute("error","User Not Found!");
                RequestDispatcher rd=req.getRequestDispatcher("/index.jsp");
                rd.include(req, res);

            }

        }
        catch(Exception e) { System.out.println(e.getMessage()); }
    }
}
