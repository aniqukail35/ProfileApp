package controller;

import beans.ProfileBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String programme = request.getParameter("programme");
        String email = request.getParameter("email");
        String hobby = request.getParameter("hobby");
        String intro = request.getParameter("intro");

        
        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgramme(programme);
        profile.setEmail(email);
        profile.setHobby(hobby);
        profile.setIntro(intro);

        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/student_profiles", "app", "app");

            String sql = "INSERT INTO profile (name, student_id, programme, email, hobby, intro) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, studentId);
            ps.setString(3, programme);
            ps.setString(4, email);
            ps.setString(5, hobby);
            ps.setString(6, intro);

            ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        

        
        request.setAttribute("profile", profile);
        RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
        rd.forward(request, response);
    }
}
