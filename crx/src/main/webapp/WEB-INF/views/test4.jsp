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
        #listDate {
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
                        &nbsp;&nbsp;
                        <i id="swapIcon" class="bi bi-arrow-repeat" onclick="swapStations()"></i>
                        &nbsp;&nbsp;
                        <label id="end">도착역</label>
                        <input id="ppInput" name="txtGoStart" type="text" class="inp200" value="서울" title="도착역">
                        <input type="button" value="조회" onclick="openChild2()">
                    </div>
                    <br>
                    <div class="rt">
                        <label for="Date">출발일</label>
                        <input type="date" id="Date" name="lostItemRegDate">        
                        &nbsp;&nbsp;
                        <label id="listtime">시간</label>
                        <select id="listtime">
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
                            <label class="listar" id="personnel">인원정보</label>
                            <select id="personnel">
                                <option value="어른 0명">어른(만13세 이상) 0명</option>
                                <option value="어른 1명" selected="selected">어른(만13세 이상) 1명</option>
                                <option value="어른 2명">어른(만13세 이상) 2명</option>
                                <option value="어른 3명">어른(만13세 이상) 3명</option>
                                <option value="어른 4명">어른(만13세 이상) 4명</option>
                                <option value="어른 5명">어른(만13세 이상) 5명</option>
                                <option value="어른 6명">어른(만13세 이상) 6명</option>
                                <option value="어른 7명">어른(만13세 이상) 7명</option>
                                <option value="어른 8명">어른(만13세 이상) 8명</option>
                                <option value="어른 9명">어른(만13세 이상) 9명</option>
                                <option value="어른 10명">어른(만13세 이상) 10명</option>
                            </select>
                            <label>명</label>
                            &nbsp;&nbsp;
                            <select id="child">
                                <option value="어린이 0명" selected="selected">어린이(만6~12세) 0명</option>
                                <option value="어린이 1명">어린이(만6~12세) 1명</option>
                                <option value="어린이 2명">어린이(만6~12세) 2명</option>
                                <option value="어린이 3명">어린이(만6~12세) 3명</option>
                                <option value="어린이 4명">어린이(만6~12세) 4명</option>
                                <option value="어린이 5명">어린이(만6~12세) 5명</option>
                                <option value="어린이 6명">어린이(만6~12세) 6명</option>
                                <option value="어린이 7명">어린이(만6~12세) 7명</option>
                                <option value="어린이 8명">어린이(만6~12세) 8명</option>
                                <option value="어린이 9명">어린이(만6~12세) 9명</option>
                                <option value="어린이 10명">어린이(만6~12세) 10명</option>
                            </select>
                            <label>명</label>
                            &nbsp;&nbsp;
                            <select id="seattype">
                                <option value="입석">입석</option>
                                <option value="일반석" selected="selected">일반석</option>
                                <option value="특실">특실</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br>
                <div class="search" id="searchResults">
                    <!-- 검색 결과가 여기에 표시됩니다 -->
                </div>
            </div>
        </div>
        <script>
            function openChild() {
                const startStation = document.querySelector("#pInput").value;
                const endStation = document.querySelector("#ppInput").value;
                const date = document.querySelector("#Date").value;
                const time = document.querySelector("#listtime").value;
                const numAdults = document.querySelector("#personnel").value;
                const numChildren = document.querySelector("#child").value;
                const seatType = document.querySelector("#seattype").value;

                // 여기에 실제 API 호출을 추가해야 합니다
                // 예시로 모의 데이터를 생성합니다
                const mockData = [
                    { train: 'KTX 101', departure: '08:00', arrival: '10:00', seat: seatType },
                    { train: 'KTX 102', departure: '09:00', arrival: '11:00', seat: seatType }
                ];

                displayResults(mockData);
            }

            function openChild2() {
                const startStation = document.querySelector("#pInput").value;
                const endStation = document.querySelector("#ppInput").value;
                const date = document.querySelector("#Date").value;
                const time = document.querySelector("#listtime").value;
                const numAdults = document.querySelector("#personnel").value;
                const numChildren = document.querySelector("#child").value;
                const seatType = document.querySelector("#seattype").value;

                // 여기에 실제 API 호출을 추가해야 합니다
                // 예시로 모의 데이터를 생성합니다
                const mockData = [
                    { train: 'KTX 201', departure: '14:00', arrival: '16:00', seat: seatType },
                    { train: 'KTX 202', departure: '15:00', arrival: '17:00', seat: seatType }
                ];

                displayResults(mockData);
            }

            function displayResults(data) {
                const resultsDiv = document.querySelector("#searchResults");
                resultsDiv.innerHTML = `
                    <h3>검색 결과</h3>
                    <table class="checkTrain">
                        <thead>
                            <tr>
                                <th>기차</th>
                                <th>출발</th>
                                <th>도착</th>
                                <th>좌석종류</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${data.map(item => `
                                <tr>
                                    <td>${item.train}</td>
                                    <td>${item.departure}</td>
                                    <td>${item.arrival}</td>
                                    <td>${item.seat}</td>
                                </tr>
                            `).join('')}
                        </tbody>
                    </table>
                `;
            }

            function swapStations() {
                const startInput = document.querySelector("#pInput");
                const endInput = document.querySelector("#ppInput");

                const temp = startInput.value;
                startInput.value = endInput.value;
                endInput.value = temp;
            }
        </script>
    </div>
</body>
</html>
