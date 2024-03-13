<%-- 
    Document   : Chapter
    Created on : Jan 16, 2024, 10:43:38 AM
    Author     : ADMIN
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="./css/confirmbox.css" rel="stylesheet">
        <link rel="shortcut icon" href="https://suustore.com/assets/frontend/images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="./assets/app.css">



        <script>
            window.SuuTruyen = {
                baseUrl: 'https://suustore.com',
                urlCurrent: 'https://suustore.com',
                csrfToken: '4EebYu2rWivdRk1ET12dyuY0CJjpRERhJynPtvUy'
            }
        </script>

        <title>Chi tiết chương</title>
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <main>
                <div class="chapter-wrapper container my-5">
                    <a href="#" class="text-decoration-none">
                        <h1 class="text-center text-success">${book.title}</h1>
                </a>
                <a href="#" class="text-decoration-none">
                    <p class="text-center text-dark">${chapter.chaptername}</p>
                </a>
                <hr class="chapter-start container-fluid">
                <div class="chapter-nav text-center">
                    <div class="chapter-actions chapter-actions-origin d-flex align-items-center justify-content-center">
                        <a class="btn btn-success me-1 chapter-prev"
                           href="chapter?bookID=${book.bookid}&chapterID=${chap.chapterid-1}" title=""> <span>Chương
                            </span>trước</a>
                        <button class="btn btn-success chapter_jump me-1" data-story-id="3" data-slug-chapter="chuong-1"
                                data-slug-story="nang-khong-muon-lam-hoang-hau">
                            <span>
                                <svg style="fill: #fff;" xmlns="http://www.w3.org/2000/svg" height="1em"
                                     viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                <path
                                    d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z">
                                </path>
                                </svg>

                            </span>
                        </button>

                        <div class="dropdown select-chapter me-1 d-none">
                            <a class="btn btn-secondary dropdown-toggle" role="button"
                               id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                Chọn chương
                            </a>

                            <ul class="dropdown-menu select-chapter__list" aria-labelledby="dropdownMenuLink">

                            </ul>
                        </div>
                        <a class="btn btn-success chapter-next"
                           href="chapter?bookID=${book.bookid}&chapterID=${chap.chapterid+1}" title=""><span>Chương
                            </span>tiếp</a>
                    </div>
                </div>
                <hr class="chapter-end container-fluid">


                <div class="chapter-content mb-3">
                    <div class="visible-md visible-lg ads-responsive incontent-ad" id="ads-chapter-pc-top" align="center"
                         style="height:90px"></div>
                    <c:if test="${vipChapterRequire_Chapter!=null}">
                        <div class="py-2" style="text-align: center;font-size: 40px;">Ðây là chapter Vip!Mua chapter 2000VND :
                            <form action="buychapter" id="deleteAcc" method="post">
                                <input type="checkbox" id="check">
                                <input type="text" name="chapterId" value="${vipChapterRequire_Chapter}" hidden="true">
                                <input type="text" name="bookId" value="${vipChapterRequire_Book}" hidden="true">
                                <label for="check" ><img src="https://static.thenounproject.com/png/2572669-200.png" alt="delete acc" style="width: 60px;height: 45px;"/></label>
                                <div class="background"></div>
                                <div class="alert_box">
                                    <div class="icon">
                                        <i class="fas fa-exclamation"></i>
                                    </div>
                                    <header>Confirm</header>
                                    <p>Mua chương này với giá 2000VND</p>
                                    <div class="btns">
                                        <label for="check" onclick="submitForm()">Có</label>
                                        <label for="check">Không</label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:if>
                    <div class="py-2"style="text-align: center;font-size: 40px;">${enoughMoney}</div>
                    <div class="py-2">${chapter.content_1}</div>
                    <div class="py-2">${chapter.content_2}</div>
                </div>

                <div class="text-center px-2 py-2 alert alert-success d-none d-lg-block" role="alert">Bạn có thể dùng phím
                    mũi tên hoặc WASD để
                    lùi/sang chương</div>
            </div>

            <div class="chapter-actions chapter-actions-mobile d-flex align-items-center justify-content-center">
                <a class="btn btn-success me-2 chapter-prev"
                   href="chapter?bookID=${book.bookid}&chapterID=${chap.chapterid-1}" title=""> <span>Chương
                    </span>trước</a>
                <button class="btn btn-success chapter_jump me-2" data-story-id="3" data-slug-chapter="chuong-1"
                        data-slug-story="nang-khong-muon-lam-hoang-hau"><span>

                        <svg style="fill: #fff;" xmlns="http://www.w3.org/2000/svg" height="1em"
                             viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                        <path
                            d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z">
                        </path>
                        </svg>
                    </span></button>

                <div class="dropup select-chapter me-2 d-none">
                    <a class="btn btn-secondary dropdown-toggle" role="button"
                       id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                        Chọn chương
                    </a>

                    <ul class="dropdown-menu select-chapter__list" aria-labelledby="dropdownMenuLink">

                    </ul>
                </div>
                <a class="btn btn-success chapter-next" href="chapter?bookID=${book.bookid}&chapterID=${chap.chapterid+1}"
                   title=""><span>Chương </span>tiếp</a>
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
        <script src="./assets/chapter.js"></script>
        <script>
            function submitForm() {
                document.getElementById("deleteAcc").submit();
            }
        </script>


        <div id="loadingPage" class="loading-full">
            <div class="loading-full_icon">
                <div class="spinner-grow"><span class="visually-hidden">Loading...</span></div>
            </div>
        </div>


    </body>

</html>