<%-- 
    Document   : Post comic
    Created on : Feb 9, 2024, 2:30:48 PM
    Author     : TTT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tạo tài khoản</title>

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/changes.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>     
    </head>

    <body style="background-color: #E6F9E6;">
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container">
                <div class="row"
                     style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
                    <form action="addaccount" onsubmit="return validateForm()" method="post" class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
                          style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;" >
                        <div style="font-weight: bold;" class="text-center">
                            <h2 style="color: green;">Tạo tài khoản từ admin</h2>
                        </div>
                        <div></div>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="last_name">Tên tài khoản</label> 
                                <input type="text"
                                       placeholder="Nhập tên tài khoản" name="username" class="form-control"
                                       id="username1" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="last_name">Mật khẩu</label> 
                                <input type="password"
                                       placeholder="Nhập mật khẩu" name="password" minlength="6" class="form-control"
                                       id="password1" required>
                                <label for="last_name">Xác nhận lại mật khẩu</label> 
                                <input type="password"
                                       placeholder="Nhập lại mật khẩu" name="repassword" minlength="6"class="form-control"
                                       id="repassword1" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="userrole">Tài khoản với quyền: </label> 
                                <select name="roleID" id="roleID" class="form-control" required>
                                    <option value="1" selected>Người dùng</option>
                                    <option value="0">Admin</option>
                                </select>
                            </div>
                        </div>
                        <p class="alert-danger" style="align-items: center">${mess1}</p>

                    <div class="row">
                        <div class="col-md-12 text-center">
                            <button type="submit" class="btn btn-success">Tạo tài khoản</button>
                        </div>
                    </div>
                </form>
                <script>
                        function validateForm() {
                            var username = document.getElementById("username1").value.trim();
                            var password = document.getElementById("password1").value.trim();
                            var repassword = document.getElementById("repassword1").value.trim();
                            if (username === "" || password === ""||repassword ==="") {
                                alert("Please fill out all required fields.");
                                return false;
                            }
                            return true;
                        }
                    </script>

            </div>
        </div>
         <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
