<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration Form</title>
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;

            if (username.trim() == '') {
                alert("Please enter a username.");
                return false;
            }

            if (email.trim() == '') {
                alert("Please enter an email address.");
                return false;
            }

            // 이메일 유효성 검사 (간단한 형식 체크)
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            if (password.trim() == '') {
                alert("Please enter a password.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
<h2>User Registration Form</h2>
<form action="${pageContext.request.contextPath}/users/register" method="post" onsubmit="return validateForm()">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <button type="submit">Register</button>
</form>
</body>
</html>