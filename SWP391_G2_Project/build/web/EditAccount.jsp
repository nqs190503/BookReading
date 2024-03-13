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
        <title>Sửa tài khoản</title>
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
                    <form action="editaccount" onsubmit="return validateForm()" method="post" class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
                          style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;" >
                        <div style="font-weight: bold;" class="text-center">
                            <h2 style="color: green;">Sửa tài khoản từ admin</h2>
                        </div>
                        <div></div>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="last_name">Tài khoản ID</label> 
                                <input type="text"
                                       name="userid" value="${laccount.userID}" class="form-control"
                                id="username1" readonly="" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label for="last_name">Tên tài khoản</label> 
                            <input type="text"
                                   name="username" value="${laccount.userName}" class="form-control"
                                   readonly="" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label for="last_name">Mật khẩu</label> 
                            <input type="password"
                                   name="password" value="${laccount.password}" class="form-control"
                                   readonly="" required>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label for="last_name">Email</label> 
                            <input type="text"
                                   placeholder="Người dùng chưa đăng ký" name="email"  value="${laccount.email}" class="form-control"
                                   readonly="" required>                                
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label for="last_name">Phone</label> 
                            <input type="text"
                                   placeholder="Người dùng chưa đăng ký" name="Phone"  value="${laccount.phone}" class="form-control"
                                   readonly="" required>                                
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label for="userrole">Tài khoản với quyền: </label> 
                            <select name="roleID" class="form-control" required>
                                <option value="1" ${laccount.roldID!=0?"selected":""} >Người dùng</option>
                                <option value="0" ${laccount.roldID==0?"selected":""}>Admin</option>
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
