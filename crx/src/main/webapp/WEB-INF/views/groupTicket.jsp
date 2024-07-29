<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>단체승차권 예매</title>
<style>
	.all{
		width: 1200px;
		margin: 0 auto;  <!-- 중앙 정렬 -->
	}
	.tiline{
		display:inline;
		border:solid 1px green;
		border-radius: 8px;
		padding: 5px;
		color: green;
		margin: 5px;
	}
	.mid{
		
		height: 300px;
		background: #f8f8f8;		
	}
	.relist{
		margin: 0 5 5 5px;
		padding: 5px;
	}
	.rt{
		margin: 3px;
	}

	.search{
		text-align: center;
	}
	.minititle a{
		color: #000000;
	}
	table, th, td {
	    border: 2px solid white;
	    border-collapse: collapse;
	}
	#Date{
		width:140px;
		display:inline;
	}
	.checkTrain{
		border: 2px solid white;
		border-collapse: collapse;
	}
	#swapIcon{
		font-size: 20px;
	}

</style>
</head>
<body>	 
<jsp:include page="header.jsp" />
<div class="all">
	
	<div class="maintitle">
		<h1>단체승차권</h1>
		<hr>
	</div>
	
	<br>
	<div style="text-align:center;">
		<img src= "../img/mark1.gif" style="width:500px">
	</div>
	
   <br>
   
	<div>
		<br>
		<ul class="nav nav-tabs">
			<li class="minititle nav-item">
				<a class="nav-link" href="ticket.do">일반승차권 조회</a>
			</li>
			<li class="minititle nav-item">
				<a class="nav-link active bg-light" aria-current="page" href="groupTicket.do">단체승차권 조회</a>
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
				<div class= "rt">
					<div>
						<label class= "listar" id="personnel">인원정보</label>
						<select style="border: 1px solid #black; padding: 5px; width: 200px; background: #fff;" name="personnel" id="personnel" class="ymd checkForm" onchange="changeWeekInfo();" option="{isMust :false, message : '인원을 선택해 주세요.'}" title="인원을 선택해 주세요">
							<option value="어른(만13세 이상) 2명">
								어른(만13세 이상) 0명
							</option>
							<option value="어른(만13세 이상) 1명" selected="selected">
								어른(만13세 이상) 1명
							</option>
							<option value="어른(만13세 이상) 2명">
								어른(만13세 이상) 2명
							</option>
							<option value="어른(만13세 이상) 3명">
								어른(만13세 이상) 3명
							</option>
							<option value="어른(만13세 이상) 4명">
								어른(만13세 이상) 4명
							</option>
							<option value="어른(만13세 이상) 5명">
								어른(만13세 이상) 5명
							</option>
							<option value="어른(만13세 이상) 6명">
								어른(만13세 이상) 6명
							</option>
							<option value="어른(만13세 이상) 7명">
								어른(만13세 이상) 7명
							</option>
							<option value="어른(만13세 이상) 8명">
								어른(만13세 이상) 8명
							</option>
							<option value="어른(만13세 이상) 9명">
								어른(만13세 이상) 9명
							</option>
							<option value="어른(만13세 이상) 10명">
								어른(만13세 이상) 10명
							</option>													
						</select>
						<label>명</label>
						
						&nbsp;&nbsp;
						<select style="border: 1px solid #black; padding: 5px; width: 200px; background: #fff;" name="child" id="child" class="ymd checkForm" onchange="changeWeekInfo();" option="{isMust :false, message : '인원을 선택해 주세요.'}" title="인원을 선택해 주세요">
							<option value="어린이(만 6~12세) 0명" selected="selected">
								어린이(만6~12세) 0명
							</option>
							<option value="어린이(만 6~12세) 1명">
								어린이(만 6~12세) 1명
							</option>
							<option value="어린이(만 6~12세) 2명">
								어린이(만 6~12세) 2명
							</option>
							<option value="어린이(만 6~12세) 3명">
								어린이(만 6~12세) 3명
							</option>
							<option value="어린이(만 6~12세) 4명">
								어린이(만 6~12세) 4명
							</option>
							<option value="어린이(만 6~12세) 5명">
								어린이(만 6~12세) 5명
							</option>
							<option value="어린이(만 6~12세) 6명">
								어린이(만 6~12세) 6명
							</option>
							<option value="어린이(만 6~12세) 7명">
								어린이(만 6~12세) 7명
							</option>
							<option value="어린이(만 6~12세) 8명">
								어린이(만 6~12세) 8명
							</option>
							<option value="어린이(만 6~12세) 9명">
								어린이(만 6~12세) 9명
							</option>
							<option value="어린이(만 6~12세) 10명">
								어린이(만 6~12세) 10명
							</option>													
					</select>
					<label>명</label>
					
						
				</div>
				
				<br><br><br>
				<div class="search">
					<button type="button" class="btn btn-success">조회하기</button>
				</div>
			</div>
		</div>	
   </div>
</div>
       <script>
           function searchTrains() {
               const start = document.getElementById('start').value;
               const end = document.getElementById('end').value;
               const date = document.getElementById('Date').value;
               const time = document.getElementById('listtime').value;
               const personnel = document.getElementById('personnel').value;
               const child = document.getElementById('child').value;
               const old = document.getElementById('old').value;
               const seattype = document.getElementById('seattype').value;
               const trainType = document.querySelector('input[name="flexRadioDefault"]:checked').nextElementSibling.textContent;

               const resultText = `
			   		<style>
			              .checkTrain {
			                  width: 100%;
			                  border-collapse: collapse;
			              }
			              .checkTrain th, .checkTrain td {
			                  border: 1px solid #ddd;
			                  padding: 8px;
			                  text-align: center;
			              }
			              .checkTrain th {
			                  background-color: #f2f2f2;
			                  color: black;
			              }
			              .checkTrain tr:nth-child(even) {
			                  background-color: #f9f9f9;
			              }
			              .checkTrain tr:hover {
			                  background-color: #ddd;
			              }
			        </style>
					<br>
			   		<table class="checkTrain">
						<thead>
						<tr>
							<th>열차종류</th>
							<th>열차번호</th>
							<th>출발역</th>
							<th>도착역</th>
							<th>좌석종류</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>소요시간</th>								
						</tr>
						</thead>
						<tbody>
							<tr>
								<td>${trainType}</td>
								<td>${trainNo}</td>
								<td>${start}</td>
								<td>${end}</td>
								<td>${seatType}</td>
								<td>${startTime}</td>
								<td>${endTime}</td>
								<td>${timeTaken}</td>
							</tr>
						</tbody>
					</table>
               `;

               document.getElementById('resultText').innerHTML = resultText;
               document.getElementById('result').style.display = 'block';
           }

           function hideResult() {
               document.getElementById('result').style.display = 'none';
           }
       
		<!-- 오늘 이전으로 선택되지 않도록 설정 -->
		var now_utc = Date.now()
		var timeOff = new Date().getTimezoneOffset()*60000;
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		document.getElementById("Date").value = new Date().toISOString().substring(0, 10);
		document.getElementById("Date").setAttribute("min", today);
		
		<!-- 출발역 도착역 바꾸기 -->
		function swapStations() {
			// 출발역과 도착역의 값을 가져옴
		    var startStation = document.getElementById('pInput').value;
		    var endStation = document.getElementById('ppInput').value;

		    // 출발역과 도착역의 값을 서로 바꿈
		    document.getElementById('pInput').value = endStation;
		    document.getElementById('ppInput').value = startStation;
		}		
</script>

<!--역 조회 -->
<script type="text/javascript">
    let openWin1, openWin2;

    function openChild() {
        window.name = "parentForm";
        openWin1 = window.open("lookUp.do", "lookUpForm", "width=570, height=350, resizable=no, scrollbars=no");
    }

    function openChild2() {
        window.name = "parentForm";
        openWin2 = window.open("lookUp2.do", "lookUp2Form", "width=570, height=350, resizable=no, scrollbars=no");
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