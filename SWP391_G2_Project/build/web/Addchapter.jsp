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
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <style>
            label {
                margin-right: 30px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

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

                <div class="pagetitle">
                    <h1>Add chapter</h1>
                </div><!-- End Page Title -->

                <section class="section contact">
                    <div>
                        <div class="card p-4">
                            <form action="addchapter?bookID=${bookID}" method="post" onsubmit="return validateForm()" >
                            <div class="row gy-4">
                                <div class="col-md-12">
                                    Chương số 
                                    <input name="numberchapter" class="form-control" value="${numbernewchap.numberchapter+1}" min="1" type="number">
                                    <div style="font-size: 13px">${mess1}
                                    </div>                                

                                    <div class="col-md-12" >
                                        Tên chương
                                        <textarea class="form-control" name="namechapter" id="namechapter" rows="1"required>${namechapter}</textarea>
                                        <div style="font-size: 13px">Không thêm cụm "Chương XX" vào tiêu đề này.

                                        </div>
                                    </div>

                                    <div class="col-md-12" >
                                        Nội dung

                                        <textarea class="form-control" name="content" id="content" rows="10" minlength="100" required>${content}</textarea>
                                        <div style="font-size: 13px" id="wordCountDisplay">Số từ: 0</div>
                                    </div>
                                </div>

                                <div class="col-md-12 text-center">
                                    <button type="submit"style="background-color: #4154f1; color: #fff;
                                            padding: 10px 20px 10px 20px; border: none; border-radius: 5px" >Save New chapter</button>
                                    <button type="reset" style="background-color: #4154f1; color: #fff;
                                            padding: 10px 20px 10px 20px; border: none; border-radius: 5px">
                                        Cancel
                                    </button>
                                </div>
                            </div>

                    </form>  
                    </div>

                    <script>
                        document.getElementById('content').addEventListener('input', function () {
                            var content = this.value;
                            var wordCount = countWords(content);
                            document.getElementById('wordCountDisplay').innerText = 'Số từ: ' + wordCount;
                        });

                        function countWords(text) {
                            var words = text.match(/\b\w+\b/g);
                            return words ? words.length : 0;
                        }
                    </script>
                        <script>
                            function validateForm() {
                                var namechapter = document.getElementById("namechapter").value.trim();
                                var content = document.getElementById("content").value.trim();

                                if (namechapter === "" || content === "") {
                                    alert("Please fill out all required fields.");
                                    return false;
                                }

                                return true;
                            }
                        </script>
                    </div>
                </div>
            </section>
        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-5">
                        <strong>Suu Truyện</strong> - <a title="Đọc truyện online" class="text-dark text-decoration-none"
                                                         href="#">Đọc truyện</a> online một cách nhanh nhất. Hỗ trợ mọi thiết bị như
                        di
                        động và máy tính bảng.
                    </div>
                    <ul class="col-12 col-md-7 list-unstyled d-flex flex-wrap list-tag">
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
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
        </footer><!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
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
