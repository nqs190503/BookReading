<%-- 
    Document   : Category
    Created on : Jan 16, 2024, 11:59:59 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!DOCTYPE html>
    <!-- saved from url=(0021)https://suustore.com/ -->
    <html lang="en">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <link rel="preconnect" href="https://fonts.googleapis.com/">
            <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="">
            <!-- Bootstrap CSS v5.2.1 -->
            <link href="./assets/bootstrap.min.css" rel="stylesheet">
            <link rel="shortcut icon" href="https://suustore.com/assets/frontend/images/favicon.ico" type="image/x-icon">
            <link rel="stylesheet" href="./assets/app.css">
            <script>
                window.SuuTruyen = {
                    baseUrl: 'https://suustore.com',
                    urlCurrent: 'https://suustore.com',
                    csrfToken: '4EebYu2rWivdRk1ET12dyuY0CJjpRERhJynPtvUy'
                }
            </script>

            <title>Demo Truyện</title>
            <meta name="description"
                  content="Đọc truyện online, truyện hay. Demo Truyện luôn tổng hợp và cập nhật các chương truyện một cách nhanh nhất.">
        </head>

        <body>
            <jsp:include page="Menu.jsp"></jsp:include>
                <main>
                    <div class="container">
                        <div class="row align-items-start">
                            <div class="col-12 col-md-8 col-lg-9 mb-3">
                                <div class="head-title-global d-flex justify-content-between mb-2">
                                    <div class="col-12 col-md-12 col-lg-12 head-title-global__left d-flex">

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="section-stories-hot__list">
                                        <%--<c:if test="${listB!=null}">--%>
                                            <c:forEach items="${listB}" var="b">
                                                <div class="story-item">
                                                    <a href="book?bookID=${b.bookid}" class="d-block text-decoration-none">
                                                        <div class="story-item__image">
                                                            <img src="${b.img}" alt="Tự Cẩm" class="img-fluid" width="150"
                                                                 height="230" loading="lazy">
                                                        </div>
                                                        <h3 class="story-item__name text-one-row story-name">${b.title}</h3>

                                                        <div class="list-badge">
                                                            <span class="story-item__badge badge text-bg-success">Full</span>

                                                            <span
                                                                class="story-item__badge story-item__badge-hot badge text-bg-danger">Hot</span>

                                                            <span
                                                                class="story-item__badge story-item__badge-new badge text-bg-info text-light">New</span>

                                                        </div>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        <%--</c:if>--%>

                                            
                                        <div class="section-stories-hot__list wrapper-skeleton d-none">
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 col-lg-3 sticky-md-top">
                            <div class="category-description bg-light p-2 rounded mb-3 card-custom">
                                <p class="mb-0 text-secondary"></p>
                                <p>${des.describe}</p>


                            </div>
                        </div>
                    </div>
                </div>
            </main>

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

            <script src="./assets/jquery.min.js">
            </script>

            <script src="./assets/popper.min.js">
            </script>

            <script src="./assets/bootstrap.min.js">
            </script>



            <script src="./assets/app.js">
            </script>
            <script src="./assets/common.js"></script>



            <div id="loadingPage" class="loading-full">
                <div class="loading-full_icon">
                    <div class="spinner-grow"><span class="visually-hidden">Loading...</span></div>
                </div>
            </div>




        </body>

    </html>
</body>
</html>
