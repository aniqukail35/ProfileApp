
package controller;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DeleteProfileServlet", urlPatterns = {"/DeleteProfileServlet"})
public class DeleteProfileServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try  {
           Class.forName("org.apache.derby.jdbc.ClientDriver");
           Connection con = DriverManager.getConnection( "jdbc:derby://localhost:1527/student_profiles", "app", "app");
           PreparedStatement ps = con.prepareStatement("DELETE FROM profile WHERE id=?");
           ps.setInt(1, id);
           ps.executeUpdate();
           
           con.close();
           response.sendRedirect("viewProfiles.jsp");
        
        } catch (Exception e){
            e.printStackTrace();
        } 
    }


}
