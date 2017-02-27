package cs505.databases;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_name = request.getParameter("username");
		String pass_word = request.getParameter("password");
		int count=0;
		
		if(user_name.equals("ipo") && pass_word.equals("ipo")){
			HttpSession session = request.getSession();
			session.setAttribute("uname", user_name);
			response.sendRedirect("welcome.jsp");
		}
		else if(user_name.isEmpty() || pass_word.isEmpty()){
			String message="Please enter a valid username and password";
			request.setAttribute("message", message);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		} 
		else
		{
		String 	connectionUrl = "jdbc:mysql://localhost:3306/";
		Connection connection = null;
			try {
			 Class.forName("com.mysql.jdbc.Driver").newInstance();
			 connection = DriverManager.getConnection(connectionUrl, "root", "root");
             String sql = "select * from chinese_wall.login";
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet results =statement.executeQuery();
             
     	   while(results.next()){
     			String username = results.getString("username");
     			System.out.println(username);
     			String password = results.getString("passwords");
     			System.out.println(password);
                if((username.equals(user_name)) && (password.equals(pass_word))){
                	HttpSession session = request.getSession();
        			session.setAttribute("uname", user_name);
        			response.sendRedirect("welcomelawyers.jsp");
        			count++;
                }

             }
     	   if(count==0){
     		  String message="Please enter a valid username and password";
     		  request.setAttribute("message", message);
     		  request.getRequestDispatcher("home.jsp").forward(request, response);   
     	   }
        }
        catch (Exception e){
            e.printStackTrace();
        }
		}
			
	}
}

