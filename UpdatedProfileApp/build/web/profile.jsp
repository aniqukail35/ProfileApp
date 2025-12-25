<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.ProfileBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Profile</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: Georgia;
            background: linear-gradient(135deg, #89CFF0, #A7E6FF, #D3F4FF);
            background-size: 400% 400%;
            animation: gradientMove 6s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .profile-box {
            width: 500px;
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.25);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #3674B5;
        }

        .item {
            background: #eef9ff;
            padding: 12px 15px;
            margin: 10px 0;
            border-radius: 10px;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .item i {
            color: #3674B5;
            width: 20px;
        }

        .label {
            font-weight: bold;
            min-width: 100px;
        }

        .btn {
            display: block;
            margin-top: 20px;
            text-align: center;
            padding: 12px;
            background: #3674B5;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn:hover {
            background: #245a8d;
        }
    </style>
</head>

<body>

<%
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
%>

<div class="profile-box">
    <h2>Profile Saved</h2>

    <div class="item">
        <i class="fa fa-user"></i>
        <span class="label">Name:</span> <%= p.getName() %>
    </div>

    <div class="item">
        <i class="fa fa-id-card"></i>
        <span class="label">Student ID:</span> <%= p.getStudentId() %>
    </div>

    <div class="item">
        <i class="fa fa-user"></i>
        <span class="label">Programme</span> <%= p.getProgramme() %>
    </div>

    <div class="item">
        <i class="fa fa-envelope"></i>
        <span class="label">Email:</span> <%= p.getEmail() %>
    </div>

    <div class="item">
        <i class="fa fa-heart"></i>
        <span class="label">Hobby:</span> <%= p.getHobby() %>
    </div>

    <div class="item">
        <i class="fa fa-comment-dots"></i>
        <span class="label">About Me:</span> <%= p.getIntro() %>
    </div>

    <a href="viewProfiles.jsp" class="btn">View All Profiles</a>
</div>

</body>
</html>
