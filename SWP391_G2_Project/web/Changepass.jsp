<%-- 
    Document   : Changepass
    Created on : Dec 29, 2023, 1:19:06 PM
    Author     : TTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
            }

            label {
                display: block;
                margin-bottom: 8px;
            }

            input {
                width: 100%;
                padding: 8px;
                margin-bottom: 12px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #4caf50;
                color: #fff;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
            .password-container {
                position: relative;
            }

            .toggle-password {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                cursor: pointer;
                color: #007BFF;
            }
            .buttons {
                margin-top: 20px;
            }

            .buttons input,
            .buttons button {
                margin-right: 10px;
                padding: 8px;
                cursor: pointer;
            }

            .buttons button {
                background-color: #d9534f;
                color: #fff;
                border: none;
            }

            .buttons button:hover {
                background-color: #c9302c;
            }
        </style>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var newPasswordInput = document.getElementById('newPassword');
                newPasswordInput.addEventListener('input', function () {
                    // Kiểm tra xem có khoảng trắng trong mật khẩu mới hay không
                    if (newPasswordInput.value.includes(' ')) {
                        alert('Mật khẩu mới không được chứa khoảng trắng.');
                        // Bạn có thể xử lý theo ý của mình ở đây, ví dụ như xóa khoảng trắng hoặc hiển thị thông báo khác.
                        newPasswordInput.value = newPasswordInput.value.replace(/\s/g, ''); // Xóa khoảng trắng
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <form id="changePasswordForm" action="changepass" method="post">
                <h2>Change Password</h2>
                <div class="alert" style="background-color: red; text-align: center; margin: 10px 10px 10px 10px">
                    ${mess}
                </div>
                <div style="display:none">
                    <label for="currentPassword">Old Password:</label>
                    <div class="password-container">
                        <input type="text" name="oldpassword" value="${user.password}" readonly="">
                    </div>
                </div>
                <div style="display:none">
                    <label for="currentPassword">ID User:</label>
                    <div class="password-container">
                        <input type="text" name="uID" value="${user.userID}" readonly>
                    </div>
                </div>
                <label for="currentPassword">Current Password:</label>
                <div class="password-container">
                    <input type="password" id="currentPassword" name="oldpass" required>
                </div>

                <label for="newPassword">New Password:</label>
                <div class="password-container">
                    <input type="password" id="newPassword" name="newpass" minlength="6" required>
                </div>

                <label for="confirmPassword">Confirm New Password:</label>
                <div class="password-container">
                    <input type="password" id="confirmPassword" name="confirm" minlength="6" required>
                </div>

                <div class="buttons">
                    <input type="submit" value="Change Password">
                    <button type="button" onclick="window.location.href = 'homepage'">Home</button>
                </div>
            </form>
        </div>
    </body>
</html>










