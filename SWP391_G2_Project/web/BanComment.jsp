<%-- 
    Document   : Report
    Created on : Mar 7, 2024, 10:52:12 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

            body {
                margin: 0;
                align-items: center;
                justify-content: space-around;
                flex-direction: column;
                height: 100vh;
                background-color: gray;
                font-family: 'Poppins', sans-serif;
            }

            .textup {
                text-align: center;
                color: rgb(11, 118, 11);
                font-weight: 700;
            }

            i {
                margin-right: 3px;
            }

            .form-box {
                background-color: #fff;
                box-shadow: 0 0 10px rgba(36, 67, 40, 0.8);
                padding: 15px;
                border-radius: 8px;
                width: 500px;
            }

            form {
                max-width: 400px;
                margin: 0 auto;
            }

            .radio-group {
                display: flex;
                margin-bottom: 16px;
            }

            input[type="radio"] {
                margin-right: 8px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-size: 17px;
                color: green;
                font-weight: 600;
            }

            input,
            textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 12px;
                box-sizing: border-box;
                border-radius: 10px;

            }

            button {
                background-color: #368b44;
                color: #fff;
                padding: 10px;
                border: none;
                border-radius: 25px;
                cursor: pointer;
                width: 100%;
                font-size: 15px;
                transition: .2s linear;
            }

            button:hover {
                background-color: #0a6808;
                border: none;
                transform: translateY(-10px);
            }

            h1 {
                color: green;
            }
        </style>
    </head>
    <body style="background-color: rgba(225,225,225,255) ;">
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="textup"> 
                <i class="fa fa-solid fa-clock"></i> 
                Lý do bị ban comment
            </div> 
            <form action="bancomment?UserID=${UserID}" method="post" id="reportForm">
            <input type="hidden" value="${UserID}"name="userid">
            <div>
                <div>Vấn đề</div>
                <select name="report" id="reportSelect" onchange="toggleDetailInput()">
                    <option value="0">------</option>
                    <option value="1">Xúc phạm nhân phẩm</option>
                    <option value="2">Phân biệt vùng miền</option>
                    <option value="3">Lời nói thô tục, vi phạm thuần phong mỹ tục       </option>
                    <option value="4">Spam nhiều lần</option>
                    <option value="5">Khác</option>
                </select>
                <input type="text" name="detail" id="detailInput" placeholder="Viết vấn đề của bạn" style="display:none"value="">
            </div>
            <!--            <div>Trong chương</div>
                        <input type="number" name="chapter">
            -->            <input type="submit" value="Gửi">
        </form>
        <div style="text-align: center;">${reportError}</div>
                <div style="text-align: center;">${reportError1}</div>

        <script>
            function toggleDetailInput() {
                var reportSelect = document.getElementById('reportSelect');
                var detailInput = document.getElementById('detailInput');

                if (reportSelect.value == '5') {
                    detailInput.style.display = 'block';


                } else {
                    detailInput.style.display = 'none';
                }
            }


        </script>
    </body>

</html>
