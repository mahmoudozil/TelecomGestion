import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class home extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        HttpSession session = req.getSession(true);
        System.out.println(session.getAttribute("name"));

        System.out.println(session.getAttribute("role"));

        if(session.getAttribute("cin") != null)
        {
            if(session.getAttribute("role").equals("Admin"))
            {
                req.setAttribute("perm","1");
            }
            else if(session.getAttribute("role").equals("EmployeService"))
            {
                req.setAttribute("perm","2");
            }
            else
            {
                req.setAttribute("perm","3");
            }
            RequestDispatcher rd = req.getRequestDispatcher("/home.jsp");
            rd.include(req, res);
        }
        else
        {
            RequestDispatcher rd=req.getRequestDispatcher("logout");
            rd.forward(req, res);
        }
    }
}