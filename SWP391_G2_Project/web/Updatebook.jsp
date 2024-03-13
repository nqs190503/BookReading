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
                    <h1>Update Book</h1>
                </div><!-- End Page Title -->

                <section class="section contact">
                    <div>
                        <div class="card p-4">
                            <form action="updatebook" method="post" onsubmit="return validateForm()">
                                <div class="row gy-4">
                                    <div class="col-md-12" style="display: none">
                                        BookID
                                        <input type="text" name="bookid" class="form-control" value="${b.bookid}" readonly="">
                                </div>
                                <div class="col-md-12">
                                    Title
                                    <input type="text" name="title" id="title" class="form-control" value="${b.title}" required>
                                </div>

                                <div class="col-md-12">
                                    Author Name
                                    <input type="text" name="authorname" id="authorname" class="form-control" value="${b.author}" required>
                                </div>
                                <div class="col-md-12">
                                    <h5>Category</h5>
                                    <c:forEach items="${category}" var="ca">
                                        <label>
                                            <input type="checkbox" style="transform:scale(1.5); margin-left: 30px" name="category" value="${ca.cateid}" 
                                                   <c:forEach items="${selectedCategories}" var="selectedCategory">
                                                       <c:if test="${ca.cateid eq selectedCategory.cateid}">
                                                           checked
                                                       </c:if>
                                                   </c:forEach>
                                                   ><br> 
                                            ${ca.catename}
                                        </label>
                                    </c:forEach>
                                </div>
                                <div class="col-md-12">
                                    Publish Date
                                    <input type="date" class="form-control" name="publishdate" value="${b.publishDate}" required>
                                </div>
                                <div class="col-md-12">
                                    Image
                                    <input type="text" class="form-control" name="image" value="${b.img}" required>
                                </div>

                                <div class="col-md-12" >
                                    Detail
                                    <textarea class="form-control" name="detail" id="detail" rows="6" required>${b.detail}</textarea>              
                                    <div style="font-size: 13px">Tóm tắt cho truyện không nên quá dài mà nên ngắn gọn, tập trung, thú vị. Phần này rất quan trọng vì nó quyết định độc giả có đọc hay không.
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    Status
                                    <select name="status" class="form-control">
                                        <option value="Full" ${b.status == 'Full' ? 'selected' : ''}>Full</option>
                                        <option value="Updating" ${b.status == 'Updating' ? 'selected' : ''}>Updating</option>
                                    </select>
                                </div>
                                <div class="col-md-12" style="display: none">
                                    Creator
                                    <input type="text" name="creator" class="form-control" value="${user.userID}" readonly>
                                </div>
                                <div class="col-md-12 text-center">
                                    <button type="submit" style="background-color: #4154f1; color: #fff; padding: 10px 20px 10px 20px; border: none; border-radius: 5px">Save Update Comic</button>
                                    <button type="reset" style="background-color: #4154f1; color: #fff; padding: 10px 20px 10px 20px; border: none; border-radius: 5px">Cancel</button>
                                </div>
                            </div>
                        </form>

                        <script>
                            function validateForm() {
                                var title = document.getElementById("title").value.trim();
                                var authorname = document.getElementById("authorname").value.trim();
                                var detail = document.getElementById("detail").value.trim();

                                if (title === "" || authorname === "" || detail === "") {
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
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
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
