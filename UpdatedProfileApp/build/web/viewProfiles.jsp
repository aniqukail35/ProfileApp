<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>
    <style>
        body {
            font-family: Georgia, serif;
            background: linear-gradient(135deg, #89CFF0, #A7E6FF, #D3F4FF);
            background-size: 400% 400%;
            animation: gradientMove 4s ease infinite;
            margin: 0;
            padding: 20px; /* Added padding for mobile breathing room */
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .form-box {
            /* This section solves your background issue */
            width: 90%;
            max-width: 900px; 
            min-width: fit-content; /* Ensures box grows to fit table width */
            background: white;
            padding: 30px;
            margin: 50px auto;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            animation: fadeIn 1s ease;
            transition: 0.3s ease;
        }

        .form-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 35px rgba(0,0,0,0.25);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Modern Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }

        th {
            background-color: #22a6b3;
            color: white;
            padding: 15px;
            text-align: left;
            border-bottom: 2px solid #ddd;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #eee;
            color: #444;
        }

        tr:hover {
            background-color: #f1f9fa;
        }

        button {
            background: #22a6b3;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 10px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: 0.3s;
            margin-top: 20px;
        }

        button:hover {
            background: #1e8e99;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

    <div class="form-box">
        <h2 style="text-align: center; color: #333; margin-top: 0;">Student Records</h2>
        
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Student ID</th>
                    <th>Programme</th>
                    <th>Email</th>
                    <th>Hobby</th>
                    <th>Intro</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/student_profiles",
                    "app","app");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM profile");

                while(rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("NAME") %></td>
                    <td><%= rs.getString("STUDENT_ID") %></td>
                    <td><%= rs.getString("PROGRAMME") %></td>
                    <td><%= rs.getString("EMAIL") %></td>
                    <td><%= rs.getString("HOBBY") %></td>
                    <td><%= rs.getString("INTRO") %></td>
                    <td><a href="DeleteProfileServlet?id=<%= rs.getInt("id") %>">Delete</a></td>
                </tr>
                
            <%
                }
                con.close();
            } catch(Exception e) {
                out.println("<tr><td colspan='5' style='color:red; text-align:center;'>Database Error: " + e.getMessage() + "</td></tr>");
                
            }
            %>
         </tbody>
        </table>

    </div>

</body>
</html>