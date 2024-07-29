<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>일반승차권 예매</title>
    <style>
        .all {
            width: 1200px;
            margin: 0 auto;
            /* 중앙 정렬 */
        }

        .tiline {
            display: inline;
            border: solid 1px green;
            border-radius: 8px;
            padding: 5px;
            color: green;
            margin: 5px;
        }

        .mid {
            height: 300px;
            background: #f8f8f8;
        }

        .relist {
            margin: 0 5 5 5px;
            padding: 5px;
        }

        .rt {
            margin: 3px;
        }

        .search {
            text-align: center;
        }

        .minititle a {
            color: #000000;
        }

        table,
        th,
        td {
            border: 2px solid white;
            border-collapse: collapse;
        }

        #Date {
            width: 140px;
            display: inline;
        }

        .checkTrain {
            border: 2px solid white;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="all">

    <div class="maintitle">
        <h1>일반승차권</h1>
        <hr>
    </div>

    <br>
    <div style="text-align:center;">
        <img src="../img/mark1.gif" style="width:500px">
    </div>

    <br>

    <div>
        <br>
        <ul class="nav nav-tabs">
            <li class="minititle nav-item">
                <a class="nav-link active bg-light" aria-current="page" href="ticket.do">일반승차권 조회</a>
            </li>
            <li class="minititle nav-item">
                <a class="nav-link" href="groupTicket.do">단체승차권 조회</a>
            </li>
        </ul>
    </div>

    <div class="mid">
        <div>
            <div class="relist">
                <br>
                <div class="rt">
                    <label id="start">출발역</label>
                    <input id="pInput" name="txtGoStart" type="text" class="inp200" value="대전" title="출발역">
                    <input type="button" value="조회" onclick="openChild()">
                    &nbsp;&nbsp;&nbsp;
                    <label id="end">도착역</label>
                    <input id="ppInput" name="txtGoStart" type="text" class="inp200" value="서울" title="도착역">
                    <input type="button" value="조회" onclick="openChild2()">
                </div>
                <br>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    let openWin1, openWin2;

    function openChild() {
        window.name = "parentForm";
        openWin1 = window.open("test4.do", "test4Form", "width=570, height=350, resizable=no, scrollbars=no");
    }

    function openChild2() {
        window.name = "parentForm";
        openWin2 = window.open("test5.do", "test5Form", "width=570, height=350, resizable=no, scrollbars=no");
    }

    function setChildText() {
        if (openWin1 && !openWin1.closed) {
            openWin1.document.getElementById("cInput").value = document.getElementById("pInput").value;
        } else {
            alert("자식 창이 닫혔거나 열리지 않았습니다.");
        }
    }

    function setChildText2() {
        if (openWin2 && !openWin2.closed) {
            openWin2.document.getElementById("ccInput").value = document.getElementById("ppInput").value;
        } else {
            alert("자식 창이 닫혔거나 열리지 않았습니다.");
        }
    }
</script>

</body>
</html>
