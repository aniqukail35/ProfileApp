<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Profile</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        html, body {
            margin: 0;
            padding: 0;
            font-family: Georgia;
            background: linear-gradient(135deg, #89CFF0, #A7E6FF, #D3F4FF);
            background-size: 400% 400%;
            animation: gradientMove 4s ease infinite;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .profile-box {
            width: 500px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.2);
            transition: 0.3s ease;
        }

        .profile-box:hover {
            transform: scale(1.02);
            box-shadow: 0 15px 40px rgba(0,0,0,0.25);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
        }

        .item {
            background: #eef9ff;
            padding: 12px 15px;
            margin: 12px 0;
            border-radius: 10px;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .item i {
            font-size: 18px;
            color: #3674B5;
        }

        .label {
            font-weight: bold;
            margin-right: 5px;
        }
    </style>
</head>

<body>
    <div class="profile-box">
        <h2>Your Profile Details</h2>

        <div class="item"><i class="fa fa-user"></i><span class="label">Name:</span> ${name}</div>
        <div class="item"><i class="fa fa-id-card"></i><span class="label">Student ID:</span> ${studentId}</div>
        <div class="item"><i class="fa fa-book"></i><span class="label">Program:</span> ${program}</div>
        <div class="item"><i class="fa fa-envelope"></i><span class="label">Email:</span> ${email}</div>
        <div class="item"><i class="fa fa-heart"></i><span class="label">Hobbies:</span> ${hobbies}</div>
        <div class="item"><i class="fa fa-comment-dots"></i><span class="label">About Me:</span> ${intro}</div>
    </div>
</body>
</html>
