<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta charset="utf-8">
        <title>My List Comic</title>
        <!-- Vendor CSS Files -->
        <!--        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
        <link href="./assets/vendor/simple-datatables/style.css" rel="stylesheet">
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <!-- Template Main CSS File -->
        <link href="./assets/css/style.css" rel="stylesheet">
        <!--        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">-->
        <!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">-->
        <link rel="stylesheet" href="css/ManagerProduct.css">
        <!--        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>-->
        <!--        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>-->
        <!--        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>-->
        <style>
            .table td {
                width: 20%; /* Đặt chiều rộng 20% cho mỗi cột */
            }
            .detail {
                /* Điều chỉnh kích cỡ nội dung trong cột Detail */
                font-size: 13px;
            }

        </style>
    </head>

    <body>
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

            <div class="pagetitle">
                <h1>List chapter</h1>
            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">

                            <div class="card-body">

                                <table class="table datatable">
                                    <thead>
                                        <tr>
                                            <th>Chương</th>
                                            <th>Tên chương</th>
                                            <th >Số chữ</th>
                                        </tr>
                                    </thead>                                        
                                    <tbody>
                                        <c:forEach items="${listchapter}" var="lc">
                                            <tr>
                                                <td class="listnumberchap"> ${lc.numberchapter} <br> 
                                                    <a href="editchapter?chapterid=${lc.chapterid}&bookID=${lc.bookid}" class="btn btn-secondary btn-sm mb-1 mr-md-1">Sửa Chương</a>
                                                    <a href="chapter?bookID=${lc.bookid}&chapterID=${lc.chapterid}"class="btn btn-secondary btn-sm mb-1 mr-md-1">Kết quả</a>
                                                    <a href="javascript:void(0);" onclick="confirmDelete(${lc.chapterid},${lc.bookid})" class="btn btn-secondary btn-sm mb-1 mr-md-1">Xóa</a>

                                                </td>
                                                <td class="listnamechap">${lc.chaptername}</td>   
                                                <td class="countwords">${map[lc.chapterid]}</td>     
                                            </tr>
                                        </c:forEach>
                                            <script>
                                        function confirmDelete(chapterid, bookid) {
                                            if (confirm("Bạn có muốn xóa chap này không?")) {
                                                // Nếu người dùng đồng ý xóa, chuyển hướng đến trang xóa với id của sách
                                                window.location.href = "deletechapter?bookID=" + bookid + "&chapterid=" + chapterid;
                                            }
                                        }
                                    </script>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>
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
        </footer>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/js/main.js"></script>

    </body>

</html>