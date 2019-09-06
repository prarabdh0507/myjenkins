package p1;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DiagnosticTest
 */
@WebServlet("/MyServlet")
public class DiagnosticTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  	 private Map<Integer,Integer> m=new HashMap<Integer,Integer>(); 

	
    public DiagnosticTest() {
        super();
   	 m.put(1,1000);
   	 m.put(2,2000);
   	 m.put(3,3000);
	 m.put(4,4000);
   	 
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i = Integer.parseInt(request.getParameter("id"));
		System.out.println(m.get(i));
		response.getWriter().append(m.get(i)+"");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
