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
                Thông tin mà bạn nhập ở đây sẽ được gửi đến Admin. Sau khi vấn đề được giải quyết, có thể bạn sẽ nhận được lời nhắn trong mục thông báo. 
            </div> 
            <form action="response" method="post" id="reportForm">
                <input type="hidden" value="${userID}"name="userID">
            <c:if test="${feedback!=null}">
                <input type="text" value="${feedback}"name="feedback">
            </c:if>
            <c:if test="${report!=null}">
                <input type="text" value="${report}"name="report">
            </c:if>
            <div>

                <input type="hidden" value="${userID}" name="userID">
                Tiêu đề : <input type="text" name="title"placeholder="Tiêu đề">
                Nội dung : <input type="text" name="detail"placeholder="Nội dung">
                <div>${mess}</div>
            </div>

            <input type="submit" value="Gửi">
        </form>


    </body>

</html>
