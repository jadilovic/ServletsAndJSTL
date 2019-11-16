package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;

/**
 * Servlet implementation class ServletPassingObjects
 */
@WebServlet("/ServletPassingObjects")
public class ServletPassingObjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPassingObjects() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user1 = new User("Bob", 1);
		User user2 = new User("Mark", 2);
		User user3 = new User("Van", 3);
		
		request.setAttribute("user1", user1);
		
		HttpSession session = request.getSession();
		session.setAttribute("user2", user2);
		
		ServletContext context = request.getServletContext();
		context.setAttribute("user3", user3);
		
		Map<String, String> map1 = new HashMap<>();
		map1.put("fruit", "apple");
		request.setAttribute("map1", map1);
		
		request.setAttribute("link", "<a href='www.klix.ba'>Link</a>");
		
		List<User> list1 = new ArrayList<>();
		list1.add(new User("fox", 1));
		list1.add(new User("chicken", 2));
		list1.add(new User("dog", 3));
		
		session.setAttribute("animals", list1);
		
		request.getRequestDispatcher("/jstlReceive.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
