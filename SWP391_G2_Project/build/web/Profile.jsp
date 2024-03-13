<%-- 
    Document   : Profile
    Created on : Jan 19, 2024, 8:31:14 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Users / Profile - NiceAdmin Bootstrap Template</title>

        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/confirmbox.css">
        <!--<link rel="stylesheet" href="./css/confirmbox_1.css">-->
        <style>
            .profile .profile-card img {
                max-width: 300px;
            }
            .profile .profile-edit img {
                max-width: 300px;
            }
        </style>
    </head>

    <body onload="vipAccMoney()">
        <jsp:include page="Menu.jsp"></jsp:include>
            <!-- ======= Sidebar ======= -->
            <aside style="margin-top: 46px" id="sidebar" class="sidebar">
                <ul class="sidebar-nav" id="sidebar-nav">
                    <li class="nav-item">
                        <i class="bi bi-grid"></i>
                        <span>Dashboard</span>
                    </li><!-- End Dashboard Nav -->   
                    <li class="nav-item">
                        <a class="nav-link " href="profile">
                            <i class="bi bi-person"></i>
                            <span>Profile</span>
                        </a>
                    </li><!-- End Profile Page Nav -->     
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="postbook">
                            <i class="bi bi-envelope"></i>
                            <span>Ðăng truyện</span>
                        </a>
                    </li><!-- End Contact Page Nav -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="mylist?creator=${user.userID}">
                        <i class="bi bi-envelope"></i>
                        <span>Danh sách truyện</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="managerchapter?creator=${user.userID}">
                        <i class="bi bi-eraser"></i>
                        <span>Quản lý chapter</span>
                    </a>
                </li>
                <c:if test="${sessionScope.user.roldID==0}">
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="manageraccount">
                            <i class="bi bi-envelope"></i>
                            <span>Quản lý tài khoản</span>
                        </a>
                    </li>
                </c:if>


            </ul>

        </aside>

        <main style="margin-top: 4px" id="main" class="main">

            <div class="pagetitle"style="display: flex;justify-content: space-between">
                <h1>Profile</h1>
                <form action="deleteaccount" id="deleteAcc" method="post">
                    <input type="checkbox" id="check">
                    <input type="text" name="userid" value="${user.userID}"hidden="true">
                    <label for="check" ><img src="https://www.svgrepo.com/show/21045/delete-button.svg" alt="delete acc" style="width: 60px;height: 45px;"/></label>
                    <div class="background"></div>
                    <div class="alert_box">
                        <div class="icon">
                            <i class="fas fa-exclamation"></i>
                        </div>
                        <header>Xác nhận</header>
                        <p>Bạn có chắc chắn muốn xóa tài khoản này ?</p>
                        <div class="btns">
                            <label for="check" onclick="submitForm()">Có</label>
                            <label for="check">Ko</label>
                        </div>
                    </div>
                </form>
            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="row">
                    <div class="col-xl-4">
                        <%--<jsp:include page="Avatar.jsp"></jsp:include>--%>
                        <div class="card">
                            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                                <img src="${user.avatar==null?"./images/defaultavatar.png":user.avatar}" width="290px" height="200px" >
                                <h6 style="margin-top: 10px" class="f-w-600">${user.userName}</h6>
                                <p>${role}</p>
                                <c:if test="${user.roldID!=2}">
                                    <form action="updateaccount" id="updateAcc" method="post">
                                        <input type="checkbox" id="check_1">
                                        <input type="text" name="userid" value="${user.userID}"hidden="true">
                                        <label for="check_1" >Nâng cấp thành tài khoản vip</label>
                                        <div class="background"></div>
                                        <div class="alert_box_1">
                                            <div class="icon">
                                                <i class="fas fa-exclamation"></i>
                                            </div>
                                            <header>Xác Nhận</header>
                                            <p>Bạn có muốn nâng cấp tài khoản thành vip với giá 30,000VND</p>
                                            <div class="btns">
                                                <label for="check_1" onclick="submitForm1()">Có</label>
                                                <label for="check_1">Ko</label>
                                            </div>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>

                    </div>

                    <div class="col-xl-8">
                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">

                                    <li class="nav-item">
                                        <button class="nav-link active" data-bs-toggle="tab"
                                                data-bs-target="#profile-overview">Profile Details</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change
                                            Password</button>
                                    </li>
                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#saved-book">
                                            Saved book</button>
                                    </li>
                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#pay-history">
                                            Chương đã mua</button>
                                    </li>
                                </ul>
                                <div class="tab-content pt-2">

                                    <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Email</div>
                                            <div class="col-lg-9 col-md-8">${user.email==null?"Chưa có email":user.email}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Address</div>
                                            <div class="col-lg-9 col-md-8">${user.address==null?"Chưa có địa chỉ":user.address}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Phone</div>
                                            <div class="col-lg-9 col-md-8">${user.phone==null?"Chưa có số điện thoại":user.phone}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Giao dịch</div>
                                            <div class="col-lg-9 col-md-8">${user.transaction}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Truyện đang đọc</div>
                                            <div class="col-lg-9 col-md-8">

                                            </div>
                                        </div>
                                        <div class="row">
                                            <table>
                                                <tr>
                                                    <td>Tiêu đề</td>
                                                    <td>Hình ảnh</td>
                                                    <td>Chapter</td>
                                                    <td>Ngày đọc</td>
                                                </tr>
                                                <c:forEach items="${reading}" var="r">
                                                    <tr>
                                                        <td>${r.title}</td>
                                                        <td><img src="${r.img}" alt="alt"/>></td>
                                                        <td><a href="chapter?bookID=${r.bookid}&chapterID=${r.chapterId}">${r.chapterName}</a></td>
                                                        <td>${r.readingDate}</td>
                                                    </tr>
                                                </c:forEach>

                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade profile-edit pt-3" id="profile-edit">
                                        <!-- Profile Edit Form -->

                                        <form action="updateprofile" method="post" enctype="multipart/form-data">
                                            <!-- Avatar -->
                                            <div class="row mb-3">
                                                <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <img src="${user.avatar==null?"./images/defaultavatar.png":user.avatar}" alt="Profile" width="300px" height="200px"><br>
<!--                                                    <input style="margin-top: 10px" name="avatar" type="text" class="form-control" id="Email" value="${user.avatar==null?"":user.avatar}">                                 -->
                                                    <!--                                                    <td>
                                                                                                            <input type="file" name="file">
                                                                                                        </td>-->
                                                    <input style="margin-top: 10px; margin-bottom: 10px" name="file" type="file" class="form-control" id="Email" value="${user.avatar==null?"":user.avatar}">
                                                </div>
                                            </div>

                                            <div class="row mb-3" style="display: none">
                                                <label for="Email" class="col-md-4 col-lg-3 col-form-label">UserID</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="userID" type="text" class="form-control" id="Email" value="${user.userID==null?"Chưa có email":user.userID}" readonly="">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="email" type="email" class="form-control" id="Email" value="${user.email==null?"Chưa có email":user.email}">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="Email" class="col-md-4 col-lg-3 col-form-label">Address</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="address" type="text" class="form-control" id="Email" value="${user.address==null?"Chưa có email":user.address}">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="phone" type="text" class="form-control" id="phone" value="${user.phone == null ? 'Chưa có điện thoại' : user.phone}" pattern="[0-9]{9,11}" title="Vui lòng nhập số điện thoại hợp lệ (từ 9 đến 11 số)" minlength="9" maxlength="11" required>
                                                </div>
                                            </div>



                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </form><!-- End Profile Edit Form -->
                                    </div>
                                    <div class="tab-pane fade pt-3" id="profile-change-password">
                                        <!-- Change Password Form -->
                                        <form id="changePasswordForm" action="changepass" method="post">
                                            <div style="display:none">
                                                <label for="currentPassword">Old Password:</label>
                                                <div class="password-container">
                                                    <input type="text" name="oldpassword" value="${user.password}" readonly="">
                                                </div>
                                            </div>
                                            <div>
                                                <label for="currentPassword">ID User:</label>
                                                <div class="password-container">
                                                    <input type="text" name="uID" value="${user.userID}" readonly>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input class="form-control" type="password" id="currentPassword" name="oldpass" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input class="form-control" type="password" id="newPassword" name="newpass" minlength="6" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input class="form-control" type="password" id="confirmPassword" name="confirm" minlength="6" required>
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Change Password</button>
                                            </div>
                                        </form>
                                        <!-- End Change Password Form -->

                                    </div>
                                    <div class="tab-pane fade pt-3" id="saved-book">

                                        <!-- Saved book -->
                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <table class="table datatable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Tên Truyện</th>
                                                                        <th>Hình Ảnh</th>
                                                                        <th>Tên Tác Giả</th>
                                                                    </tr>
                                                                </thead>                                        
                                                                <tbody>
                                                                    <c:forEach items="${savebook}" var="b">
                                                                        <tr>
                                                                            <td class="title">${b.title} <br></td>
                                                                            <td class="image"><img src="${b.img}" width="100px"></td>
                                                                            <td class="author">${b.author}</td>
                                                                    <form action="deletesavebook" method="post">
                                                                        <td><input type="text" name="bookID" value="${b.bookid}"hidden="true"></td>
                                                                        <input type="text" name="userID"value="${user.userID}"hidden="true">
                                                                        <input type="text" name="listinprofile" value="listinprofile" hidden="true">
                                                                        <td><button type="submit"><img src="https://www.svgrepo.com/show/21045/delete-button.svg" style="width: 30px;height: 20px" alt="delete"/></button></td>
                                                                    </form>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>                                      
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>
                                    <div class="tab-pane fade pt-3" id="pay-history">

                                        <!-- Saved book -->
                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <table class="table datatable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Tên Truyện</th>
                                                                        <th>Tên Chapter</th>
                                                                        <th>Ngày mua</th>
                                                                    </tr>
                                                                </thead>                                        
                                                                <tbody>
                                                                    <c:forEach items="${payChapter}" var="b">
                                                                        <tr>
                                                                            <td class="title">${b.title} <br></td>
                                                                            <td class="image"><a href="chapter?bookID=${b.bookId}&chapterID=${b.chapterId}">Chương ${b.numberChapter}: ${b.chapterName}</a></td>
                                                                            <td class="author">${b.payDate}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>                                      
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>
                                </div><!-- End Bordered Tabs -->
                                <%
                                String mess = (String) request.getAttribute("mess");
                                if (mess != null && !mess.isEmpty()) {
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <%= mess %>
                                </div>
                                <%
                                }
                                %>      
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->
        <div id="footer" class="footer border-top pt-2">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-5">
                        <strong>Suu Truyện</strong> - <a title="Đọc truyện online" class="text-dark text-decoration-none"
                                                         href="#">Đọc truyện</a> online một cách nhanh nhất. Hỗ trợ mọi thiết bị như
                        di
                        động và máy tính bảng.
                    </div>
                    <ul class="col-12 col-md-7 list-unstyled d-flex flex-wrap list-tag">
                        <c:forEach items="${category}" var="ca">
                            <li class="me-1">
                                <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                     href="category?cid=${ca.cateid}">${ca.catename}</a></span>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="col-12"> <a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img
                                alt="Creative Commons License" style="border-width:0;margin-bottom: 10px"
                                src="./assets/images/88x31.png"></a><br>
                        <p>Website hoạt động dưới Giấy phép truy cập mở <a rel="license"
                                                                           class="text-decoration-none text-dark hover-title"
                                                                           href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0
                                International License</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Vendor JS Files -->
        <script>
            function submitForm() {
                document.getElementById("deleteAcc").submit();
            }
            function submitForm1() {
                document.getElementById("updateAcc").submit();
            }
            <c:if test="${vipAccMoney!=null}">
            function vipAccMoney() {
                alert("${vipAccMoney}");
            }
            </c:if>
        </script>
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
