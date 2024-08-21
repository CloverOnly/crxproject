<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>일반승차권 예매</title>
    <style>
        .all {
            width: 1200px;
            margin: 0 auto; /* 중앙 정렬 */
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
            margin: 0 5px;
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
        table, th, td {
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
            width: 100%;
        }
        #swapIcon {
            font-size: 20px;
            cursor: pointer; /* 클릭 가능성 추가 */
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
                    <div class="rt" id="station">
                        <label for="depplacename">출발역</label>
                        <input id="depplacename" name="depplacename" type="text" class="inp200" title="출발역">
                        <input type="hidden" id="depPlaceIdHidden">
                        <input type="button" value="조회" onclick="openChild()">
                        &nbsp;&nbsp;
                        <i id="swapIcon" class="bi bi-arrow-repeat" onclick="swapStations()"></i>
                        &nbsp;&nbsp;
                        <label for="arrplacename">도착역</label>
                        <input id="arrplacename" name="arrplacename" type="text" class="inp200" title="도착역">
                        <input type="hidden" id="arrPlaceIdHidden">
                        <input type="button" value="조회" onclick="openChild2()">
                    </div>

                    <br>
                    <div class="rt" id="arrplandtime">
                        <label for="Date">출발일</label>
                        <input type="date" id="Date" name="lostItemRegDate" onchange="formatDate()">
                        <input type="hidden" id="formattedDate">
                    
                        &nbsp;&nbsp;
                        <label for="timeSelect">시간</label>
                        <select id="timeSelect">
                            <option value="08" selected="selected">08</option>
                            <option value="09">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                        </select>
                        <label id="listtime">시</label>
                    </div>

                    <br>
                    <div class="rt">
                        <div>
                            <label for="personnel">인원정보</label>
                            <select id="personnel">
                                <option value="0">어른(만13세 이상) 0명</option>
                                <option value="1" selected="selected">어른(만13세 이상) 1명</option>
                                <option value="2">어른(만13세 이상) 2명</option>
                                <option value="3">어른(만13세 이상) 3명</option>
                                <option value="4">어른(만13세 이상) 4명</option>
                                <option value="5">어른(만13세 이상) 5명</option>
                                <option value="6">어른(만13세 이상) 6명</option>
                                <option value="7">어른(만13세 이상) 7명</option>
                                <option value="8">어른(만13세 이상) 8명</option>
                                <option value="9">어른(만13세 이상) 9명</option>
                                <option value="10">어른(만13세 이상) 10명</option>
                            </select>
                            <label for="child">명</label>
                            &nbsp;&nbsp;
                            <select id="child">
                                <option value="0" selected="selected">어린이(만6~12세) 0명</option>
                                <option value="1">어린이(만6~12세) 1명</option>
                                <option value="2">어린이(만6~12세) 2명</option>
                                <option value="3">어린이(만6~12세) 3명</option>
                                <option value="4">어린이(만6~12세) 4명</option>
                                <option value="5">어린이(만6~12세) 5명</option>
                                <option value="6">어린이(만6~12세) 6명</option>
                                <option value="7">어린이(만6~12세) 7명</option>
                                <option value="8">어린이(만6~12세) 8명</option>
                                <option value="9">어린이(만6~12세) 9명</option>
                                <option value="10">어린이(만6~12세) 10명</option>
                            </select>
                            <label for="child">명</label>
                        </div>
                    </div>

                    <br>
                    <div class="rt">
                        <label id="seattype">좌석종류</label>
                        <select>
                            <option value="일반" selected="selected">일반</option>
                            <option value="특실">특실</option>
                        </select>
                    </div>

                    <br>
                    <div class="search">
                        <button type="button" onclick="fetchTicketInfo()">조회</button>
                    </div>
                </div>
            </div>
            <div id="results">
                <!-- 결과 테이블이 여기에 표시됩니다. -->
            </div>
        </div>
    </div>

    <script>
        function formatDate() {
            const dateInput = document.getElementById('Date').value;
            const formattedDate = new Date(dateInput).toISOString().split('T')[0];
            document.getElementById('formattedDate').value = formattedDate;
        }

        function fetchTicketInfo() {
            const depPlace = document.getElementById('depplacename').value;
            const arrPlace = document.getElementById('arrplacename').value;
            const date = document.getElementById('formattedDate').value;
            const time = document.getElementById('timeSelect').value;
            const personnel = document.getElementById('personnel').value;
            const child = document.getElementById('child').value;
            const seattype = document.querySelector('select').value;

            // API 호출을 위한 쿼리 파라미터
            const queryParams = new URLSearchParams({
                depPlaceName: depPlace,
                arrPlaceName: arrPlace,
                depDate: date,
                depTime: time,
                numAdults: personnel,
                numChildren: child,
                seatType: seattype
            }).toString();

            fetch(`https://api.example.com/tickets?${queryParams}`)
                .then(response => response.json())
                .then(data => {
                    displayResults(data);
                })
                .catch(error => console.error('Error fetching ticket info:', error));
        }

        function displayResults(data) {
            // 결과를 테이블 형태로 표시
            const resultsDiv = document.getElementById('results');
            let html = '<table class="checkTrain">';
            html += '<thead><tr><th>시간</th><th>출발역</th><th>도착역</th><th>좌석종류</th><th>가격</th></tr></thead>';
            html += '<tbody>';

            data.forEach(ticket => {
                html += `<tr>
                            <td>${ticket.time}</td>
                            <td>${ticket.depPlace}</td>
                            <td>${ticket.arrPlace}</td>
                            <td>${ticket.seatType}</td>
                            <td>${ticket.price}</td>
                        </tr>`;
            });

            html += '</tbody></table>';
            resultsDiv.innerHTML = html;
        }

        function openChild() {
            // 자식 창을 열고 입력값을 가져옵니다.
            const depPlace = window.open('child.html', 'child', 'width=600,height=400');
            depPlace.onload = function() {
                depPlace.document.getElementById('placeName').value = document.getElementById('depplacename').value;
                depPlace.document.getElementById('searchButton').onclick = function() {
                    const selectedPlace = depPlace.document.getElementById('placeName').value;
                    document.getElementById('depplacename').value = selectedPlace;
                    depPlace.close();
                };
            };
        }

        function openChild2() {
            // 자식 창을 열고 입력값을 가져옵니다.
            const arrPlace = window.open('child2.html', 'child2', 'width=600,height=400');
            arrPlace.onload = function() {
                arrPlace.document.getElementById('placeName').value = document.getElementById('arrplacename').value;
                arrPlace.document.getElementById('searchButton').onclick = function() {
                    const selectedPlace = arrPlace.document.getElementById('placeName').value;
                    document.getElementById('arrplacename').value = selectedPlace;
                    arrPlace.close();
                };
            };
        }

        function swapStations() {
            const depPlace = document.getElementById('depplacename').value;
            const arrPlace = document.getElementById('arrplacename').value;

            document.getElementById('depplacename').value = arrPlace;
            document.getElementById('arrplacename').value = depPlace;
        }
    </script>
</body>
</html>
