
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class home extends HttpServlet {
    public void doGet(HttpServletRequest req , HttpServletResponse res) throws ServletException,IOException
    {
        //create session
        System.out.println("going home");
        RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
        rd.include(req, res);
    }
}