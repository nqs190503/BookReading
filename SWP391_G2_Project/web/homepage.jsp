<%-- 
    Document   : homepage
    Created on : Jan 11, 2024, 9:07:37 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div class="section-stories-hot mb-3">
                    <div class="container">
                        <div class="row">
                            <div class="head-title-global d-flex justify-content-between mb-2">
                                <div class="col-6 col-md-4 col-lg-4 head-title-global__left d-flex align-items-center">
                                    <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                        <a href="#" class="d-block text-decoration-none text-dark fs-4 story-name"
                                           title="Truyện Hot">Truyện Hot</a>
                                    </h2>
                                    <i class="fa-solid fa-fire-flame-curved"></i>
                                </div>


                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="section-stories-hot__list">
                                <c:forEach items="${book}" var="b">
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
                <div class="container">
                    <div class="row align-items-start">
                        <div class="col-12 col-md-8 col-lg-9">
                            <div class="section-stories-new mb-3">
                                <div class="row">
                                    <div class="head-title-global d-flex justify-content-between mb-2">
                                        <div class="col-6 col-md-4 col-lg-4 head-title-global__left d-flex align-items-center">
                                            <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                                <a href="#"
                                                   class="d-block text-decoration-none text-dark fs-4 story-name"
                                                   title="Truyện Mới">Truyện Mới</a>
                                            </h2>
                                        </div>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <div class="section-stories-new__list">
                                            <c:forEach items="${bookdate}" var="bd">
                                                <div class="story-item-no-image">
                                                    <div class="story-item-no-image__name d-flex align-items-center">
                                                        <h3 class="me-1 mb-0 d-flex align-items-center">

                                                            <svg style="width: 10px; margin-right: 5px;"
                                                                 xmlns="http://www.w3.org/2000/svg" height="1em"
                                                                 viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                            <path
                                                                d="M278.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-160 160c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L210.7 256 73.4 118.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l160 160z">
                                                            </path>
                                                            </svg>
                                                            <a href="book?bookID=${bd.bookid}"
                                                               class="text-decoration-none text-dark fs-6 hover-title text-one-row story-name">${bd.title}</a>
                                                        </h3>
                                                        <span class="badge text-bg-info text-light me-1">New</span>

                                                        <span class="badge text-bg-success text-light me-1">Full</span>

                                                        <span class="badge text-bg-danger text-light">Hot</span>
                                                    </div>

                                                    <div class="story-item-no-image__categories ms-2 d-none d-lg-block">
                                                        <p class="mb-0">
                                                        </p>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-4 col-lg-3 sticky-md-top">
                            <div class="row">

                                <div class="col-12">
                                    <div class="section-list-category bg-light p-2 rounded card-custom">
                                        <div class="head-title-global mb-2">
                                            <div class="col-12 col-md-12 head-title-global__left">
                                                <h2 class="mb-0 border-bottom border-secondary pb-1">
                                                    <span href="#" class="d-block text-decoration-none text-dark fs-4"
                                                          title="Truyện đang đọc">Thể loại truyện</span>
                                                </h2>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- Horizontal under breakpoint -->
                                            <ul class="list-category">
                                                <c:forEach items="${category}" var="ca">
                                                    <li class="">
                                                        <a href="category?cid=${ca.cateid}" class="text-decoration-none text-dark hover-title">${ca.catename}</a>
                                                    </li>
                                                </c:forEach>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="section-stories-full mb-3 mt-3">
                    <div class="container">
                        <div class="row">
                            <div class="head-title-global d-flex justify-content-between mb-2">
                                <div class="col-12 col-md-4 head-title-global__left d-flex">
                                    <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                        <span class="d-block text-decoration-none text-dark fs-4 title-head-name"
                                              title="Truyện đã hoàn thành">Truyện đã hoàn thành</span>
                                    </h2>
                                    <!-- <i class="fa-solid fa-fire-flame-curved"></i> -->
                                </div>
                            </div>
                        </div>

                        <!--                        <div class="row">
                                                    <div class="col-12">
                                                        <div class="section-stories-full__list">
                                                            <div class="story-item-full text-center">
                                                                <a href="#" class="d-block story-item-full__image">
                                                                    <img src="./assets/images/tu_cam.jpg" alt="Tự Cẩm" class="img-fluid w-100"
                                                                         width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Tự Cẩm
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 836 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/ngao_the_dan_than.jpg" alt="Ngạo Thế Đan Thần"
                                                                         class="img-fluid w-100" width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Ngạo Thế Đan Thần
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 3808 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/nang_khong_muon_lam_hoang_hau.jpg"
                                                                         alt="Nàng Không Muốn Làm Hoàng Hậu" class="img-fluid w-100" width="150"
                                                                         height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Nàng Không Muốn Làm Hoàng Hậu
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 80 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/kieu_sung_vi_thuong.jpg" alt="Kiều Sủng Vi Thượng"
                                                                         class="img-fluid w-100" width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Kiều Sủng Vi Thượng
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 81 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/linh_vu_thien_ha.jpg" alt="Linh Vũ Thiên Hạ"
                                                                         class="img-fluid w-100" width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Linh Vũ Thiên Hạ
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 5024 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/anh_dao_ho_phach.jpg" alt="Anh Đào Hổ Phách"
                                                                         class="img-fluid w-100" width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Anh Đào Hổ Phách
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 93 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/cuoi_truoc_yeu_sau_mong_tieu_nhi.jpg"
                                                                         alt="Cưới Trước Yêu Sau - Mộng Tiêu Nhị" class="img-fluid w-100" width="150"
                                                                         height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Cưới Trước Yêu Sau - Mộng Tiêu Nhị
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 96 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#" class="d-block story-item-full__image">
                                                                    <img src="./assets/images/me_dam.jpg" alt="Mê Đắm" class="img-fluid w-100"
                                                                         width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Mê Đắm
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 118 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/khong_phu_the_duyen.jpg" alt="Không Phụ Thê Duyên"
                                                                         class="img-fluid w-100" width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Không Phụ Thê Duyên
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 177 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/diu_dang_tan_xuong.jpg" alt="Dịu Dàng Tận Xương"
                                                                         class="img-fluid w-100" width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Dịu Dàng Tận Xương
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 108 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/vo_chong_sieu_sao_hoi_ngot.jpg"
                                                                         alt="Vợ Chồng Siêu Sao Hơi Ngọt" class="img-fluid w-100" width="150"
                                                                         height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Vợ Chồng Siêu Sao Hơi Ngọt
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 100 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/that_u_that_u_phai_la_hong_phai_xanh_tham.jpg"
                                                                         alt="Thật Ư? Thật Ư? Phải Là Hồng Phai Xanh Thắm" class="img-fluid w-100"
                                                                         width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Thật Ư? Thật Ư? Phải Là Hồng Phai Xanh Thắm
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 229 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/thien_huong_nguoi_mu_liec_mat_dua_tinh.jpg"
                                                                         alt="Thiên Hướng Người Mù, Liếc Mắt Đưa Tình" class="img-fluid w-100"
                                                                         width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Thiên Hướng Người Mù, Liếc Mắt Đưa Tình
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 70 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/hat_de_va_chanel.jpg" alt="Hạt Dẻ Và Chanel"
                                                                         class="img-fluid w-100" width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Hạt Dẻ Và Chanel
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 6 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/em_anh_va_chung_ta.jpg" alt="Em, Anh Và Chúng Ta"
                                                                         class="img-fluid w-100" width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Em, Anh Và Chúng Ta
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 105 chương</span>
                                                            </div>
                                                            <div class="story-item-full text-center">
                                                                <a href="#"
                                                                   class="d-block story-item-full__image">
                                                                    <img src="./assets/images/me_vo_khong_loi_ve.jpg" alt="Mê Vợ Không Lối Về"
                                                                         class="img-fluid w-100" width="150" height="230" loading="lazy">
                                                                </a>
                                                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                                    <a href="#"
                                                                       class="text-decoration-none text-one-row story-name">
                                                                        Mê Vợ Không Lối Về
                                                                    </a>
                                                                </h3>
                                                                <span class="story-item-full__badge badge text-bg-success">Full - 1845 chương</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->
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
