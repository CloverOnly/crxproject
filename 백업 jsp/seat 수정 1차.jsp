<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<title>좌석 선택</title>
    <style>
        body {
            margin: 0;
        }
        .seat-container {
            display: inline-block;
            list-style: none;
            padding: 0;
            margin: 0 5px;
        }
        .seat-button {
            position: relative;
            background: url(../img/seat1.jpg) no-repeat center center;
            background-size: 63%;
            width: 63px;
            height: 60px;
            border: none;
            cursor: pointer;
            text-align: center;
        }
		/* 선택된 좌석 이미지 */
		.seat-button.selected {
		    background: url('../img/seat2.jpg') no-repeat center center;
            background-size: 63%;
		}
        .seat-button label {
            position: absolute;
            left: 59%;
            transform: translateX(-50%);
            color: black;
            font-size: 14px;
            font-weight: bold;
            top: 27px;
        }
        .line {
            border: solid 2px green;
        }
        .seatAll {
            border-width: 10px 5px 5px 5px;
            border-style: solid;
            border-color: green;
        }
        .seatTitle {
            background: green;
            color: white;
            width: 100%;
            height: 60px;
            text-align: center;
            line-height: 60px;
            margin: 1;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .uall {
            margin: -14px;
        }
        .hoBa {
            background: url(../img/train.png) no-repeat center center;
            background-size: cover;
            height: 110px;
        }
        .ho {
            list-style: none;
            display: inline-block;
        }
        .hocha {
            position: relative;
            background: url(../img/ss.jpg) no-repeat center center;
            background-size: cover;
            width: 111px;
            height: 48px;
            border: none;
            cursor: pointer;
            text-align: center;
            top: 48px;
            right: -85%;
        }
		/* 선택된 호차의 이미지 */
		.hocha.selected {
		    background: url('../img/ss2.jpg') no-repeat center center;
		    background-size: cover;
		}
		a:hover .hocha {
		    background-image: url('../img/ss2.jpg');
		    background-size: cover;
		}
        .ho label {
            position: absolute;
            left: 38%;
            color: black;
            font-size: 14px;
            font-weight: bold;
            top: 14px;
        }
        .line2 {
            position: relative;
            width: 820px;
            height: 1px;
            background: repeating-linear-gradient(to right, 
                black 0%, 
                black 2px, 
                transparent 2px, 
                transparent 4px
            );
            background-size: 4px 100%;
            color: green;
            margin: 24px;
        }
        .cre {
            position: relative;
            left: 99%;
            top: -15px;
            font-size: 21px;
            background-repeat: repeat-x;
            color: green;
        }
        #seatReservation {
			background: green;
			    color: white;
			    border: 1px solid green;
			    border-radius: 12px;
			    padding: 10px;
			    position: absolute;
			    bottom: 138px;
			    right: 15px
        }
        .butt {
            text-align: center;
        }
        .tli {
            font-size: 12px;
        }
        .fie {
            width: 950px;
        }
        .centered-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
        .inf {
            float: right;
        }
    </style>
    <meta name="viewport" content="width=1000">
	<script>
	    let selectedHocha = '';
	    let selectedSeats = []; // 선택된 좌석을 저장할 배열
	    let totalCount = 0; // 총 인원 수를 저장할 변수

	    function toggleSeat(sectionId, buttonElement) {
	        document.querySelectorAll('.hocha').forEach(function(button) {
	            button.classList.remove('selected');
	        });

	        document.querySelectorAll('.section').forEach(function(section) {
	            section.style.display = 'none';
	        });

	        buttonElement.classList.add('selected');
	        selectedHocha = buttonElement.querySelector('label').innerText;

	        const section = document.getElementById(sectionId);
	        if (section) {
	            section.style.display = 'block';
	        }

	        updateSelectionInfo();
	    }

	    function abcdSeat(buttonElement) {
	        const isSelected = buttonElement.classList.contains('selected');
	        
	        if (!isSelected && selectedSeats.length < totalCount) {
	            buttonElement.classList.add('selected');
	            selectedSeats.push(buttonElement.value);
	        } else if (isSelected) {
	            buttonElement.classList.remove('selected');
	            selectedSeats = selectedSeats.filter(seat => seat !== buttonElement.value);
	        }
	        
	        updateSelectionInfo();
	    }

	    function updateSelectionInfo() {
	        const seatCheck = document.getElementById('sitCheck');
	        const hocha = document.getElementById('sitHo');

	        if (selectedSeats.length > 0) {
	            seatCheck.innerText = selectedSeats.join(', ');
	            hocha.innerText = selectedHocha;
	            hocha.style.display = 'inline'; // 호차 정보 표시
	        } else {
	            seatCheck.innerText = '';
	            hocha.innerText = '';
	            hocha.style.display = 'none'; // 호차 정보 숨김
	        }
	    }

	    function setFormValues() {
	        var startname = window.opener.document.getElementById('depplacename').value;
	        var endname = window.opener.document.getElementById('arrplacename').value;
	        var seatType = window.opener.document.getElementById('seatType').value;
	        var startdate = window.opener.document.getElementById('formattedDate').value;
			var trainType = window.opener.document.querySelector('input[name="flexRadioDefault"]:checked').value;
	        var personnelCount = parseInt(window.opener.document.getElementById('hiddenPersonnel').value, 10);
	        var childCount = parseInt(window.opener.document.getElementById('hiddenChild').value, 10);
	        totalCount = personnelCount + childCount; // 총 인원 수 계산

			var queryString = window.location.search;
			var urlParams = new URLSearchParams(queryString);

			var trainno = urlParams.get('trainno');
			var depTime = urlParams.get('depTime');
			var arrTime = urlParams.get('arrTime');
			var duration = urlParams.get('duration');
			
	        console.log('출발지: ', startname);
	        console.log('도착지: ', endname);
	        console.log('시트타입: ', seatType);
	        console.log('출발일: ', startdate);
	        console.log('열차종류: ', trainType);
	        console.log('어른인원: ', personnelCount);
	        console.log('아동인원: ', childCount);
	        console.log('전체인원: ', totalCount);	
			console.log('열차번호: ', trainno);
			console.log('출발시간: ', depTime);
			console.log('도착시간: ', arrTime);
			console.log('소요시간: ', duration);
				
			document.getElementById('selectedSeats').value = selectedSeats.join(',');
			document.getElementById('hocha').value = selectedHocha;							
			document.getElementById('startname').value = startname;
			document.getElementById('endname').value = endname;
			document.getElementById('seatType').value = seatType;
			document.getElementById('startdate').value = startdate;
			document.getElementById('trainType').value = trainType;
			document.getElementById('personnelCount').value = personnelCount;
			document.getElementById('childCount').value = childCount;
			document.getElementById('trainno').value = trainno;
			document.getElementById('depTime').value = depTime;
			document.getElementById('arrTime').value = arrTime;
			document.getElementById('duration').value = duration;
	    }

	    window.onload = function() {
	        // 첫 번째 onload 핸들러에서 호출할 함수
	        const firstSectionButton = document.querySelector('.hocha[data-section="section1"]');
	        if (firstSectionButton) {
	            toggleSeat('section1', firstSectionButton);
	        }
	    };

	    // 페이지가 완전히 로드된 후 setFormValues 호출
	    window.addEventListener('load', function() {
	        setFormValues();
	    });
		
		function seatForm() {
		    // 선택된 좌석 정보와 호차 정보를 숨겨진 필드에 설정
		    document.getElementById('selectedSeats').value = selectedSeats.join(',');
		    document.getElementById('hocha').value = selectedHocha;

		    // 추가 데이터 필드 설정
		    document.getElementById('startname').value = window.opener.document.getElementById('depplacename').value;
		    document.getElementById('endname').value = window.opener.document.getElementById('arrplacename').value;
		    document.getElementById('seatType').value = window.opener.document.getElementById('seatType').value;
		    document.getElementById('startdate').value = window.opener.document.getElementById('formattedDate').value;
		    document.getElementById('trainType').value = window.opener.document.querySelector('input[name="flexRadioDefault"]:checked').value;
		    document.getElementById('personnelCount').value = parseInt(window.opener.document.getElementById('hiddenPersonnel').value, 10);
		    document.getElementById('childCount').value = parseInt(window.opener.document.getElementById('hiddenChild').value, 10);
		    document.getElementById('trainno').value = new URLSearchParams(window.location.search).get('trainno');
		    document.getElementById('depTime').value = new URLSearchParams(window.location.search).get('depTime');
		    document.getElementById('arrTime').value = new URLSearchParams(window.location.search).get('arrTime');
		    document.getElementById('duration').value = new URLSearchParams(window.location.search).get('duration');

		    // 폼 제출
		    document.getElementById('seatForm').submit();
		    
		    // 폼 제출 후 부모 창을 새로고침하고 현재 창을 닫습니다.
		    if (window.opener && !window.opener.closed) {
		        window.opener.location.href = "/reservation.do"; 
		    }
		    window.close(); // 현재 창 닫기
		}


	</script>



</head>
<body>
    <div class="seatTitle">    
        <h2>좌석 선택</h2>
    </div>
    <div class="seatAll">
        <ul class="tli">
            <li>요청하신 승객 명의 원하시는 좌석을 선택하여 주십시오.</li>
            <li>발매가 가능한 좌석을 선택하실 수 있습니다.</li>
            <li>원하시는 좌석을 선택 후 <strong>[선택좌석 예약하기]</strong> 버튼을 클릭하시면 예약이 완료됩니다.</li>
            <li>원하지 않는 좌석이 선택된 경우에는 좌석을 한번 더 클릭하시면 취소됩니다.</li>
        </ul>
        <div class="centered-container">
            <fieldset class="fie">
				<ul class="hoBa">
				    <li class="ho">
				        <button class="hocha" data-section="section1" onclick="toggleSeat('section1', this)">
				            <label>1호차</label>
				        </button>
				    </li>
				    <li class="ho">
				        <button class="hocha" data-section="section2" onclick="toggleSeat('section2', this)">
				            <label>2호차</label>
				        </button>
				    </li>
				    <li class="ho">
				        <button class="hocha" data-section="section3" onclick="toggleSeat('section3', this)">
				            <label>3호차</label>
				        </button>
				    </li>
				    <li class="ho">
				        <button class="hocha" data-section="section4" onclick="toggleSeat('section4', this)">
				            <label>4호차</label>
				        </button>
				    </li>
				    <li class="ho">
				        <button class="hocha" data-section="section5" onclick="toggleSeat('section5', this)">
				            <label>5호차</label>
				        </button>
				    </li>
				    <li class="ho">
				        <button class="hocha" data-section="section6" onclick="toggleSeat('section6', this)">
				            <label>6호차</label>
				        </button>
				    </li>
				</ul>
            </fieldset>
        </div>
        
        <br>
        <div class="inf">
            <span><span style="color: green;">■</span> 선택좌석</span> <span><span style="color: gray;">■</span> 선택불가</span> <span>□ 선택가능</span>
        </div>
        <br>
        
        <ul class="line"></ul>
        
        <div id="section1" class="section" style="display: block;">  
				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1A" onclick="abcdSeat(this)">
							<label>1A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2A" onclick="abcdSeat(this)">
							<label>2A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3A" onclick="abcdSeat(this)">
							<label>3A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4A" onclick="abcdSeat(this)">
							<label>4A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5A" onclick="abcdSeat(this)">
							<label>5A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6A" onclick="abcdSeat(this)">
							<label>6A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7A" onclick="abcdSeat(this)">
							<label>7A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8A" onclick="abcdSeat(this)">
							<label>8A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9A" onclick="abcdSeat(this)">
							<label>9A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10A" onclick="abcdSeat(this)">
							<label>10A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="11A" onclick="abcdSeat(this)">
							<label>11A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12A" onclick="abcdSeat(this)">
							<label>12A</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1B" onclick="abcdSeat(this)">
							<label>1B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2B" onclick="abcdSeat(this)">
							<label>2B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3B" onclick="abcdSeat(this)">
							<label>3B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4B" onclick="abcdSeat(this)">
							<label>4B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5B" onclick="abcdSeat(this)">
							<label>5B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6B" onclick="abcdSeat(this)">
							<label>6B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7B" onclick="abcdSeat(this)">
							<label>7B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8B" onclick="abcdSeat(this)">
							<label>8B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9B" onclick="abcdSeat(this)">
							<label>9B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10B" onclick="abcdSeat(this)">
							<label>10B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value= "11B" onclick="abcdSeat(this)">
							<label>11B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12B" onclick="abcdSeat(this)">
							<label>12B</label>
						</button>
					</li>
				</ul>

				<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1C" onclick="abcdSeat(this)">
								<label>1C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2C" onclick="abcdSeat(this)">
								<label>2C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3C" onclick="abcdSeat(this)">
								<label>3C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4C" onclick="abcdSeat(this)">
								<label>4C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5C" onclick="abcdSeat(this)">
								<label>5C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6C" onclick="abcdSeat(this)">
								<label>6C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7C" onclick="abcdSeat(this)">
								<label>7C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8C" onclick="abcdSeat(this)">
								<label>8C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9C" onclick="abcdSeat(this)">
								<label>9C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10C" onclick="abcdSeat(this)">
								<label>10C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11C" onclick="abcdSeat(this)">
								<label>11C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12C" onclick="abcdSeat(this)">
								<label>12C</label>
							</button>
						</li>
					</ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1D" onclick="abcdSeat(this)">
								<label>1D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2D" onclick="abcdSeat(this)">
								<label>2D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3D" onclick="abcdSeat(this)">
								<label>3D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4D" onclick="abcdSeat(this)">
								<label>4D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5D" onclick="abcdSeat(this)">
								<label>5D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6D" onclick="abcdSeat(this)">
								<label>6D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7D" onclick="abcdSeat(this)">
								<label>7D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8D" onclick="abcdSeat(this)">
								<label>8D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9D" onclick="abcdSeat(this)">
								<label>9D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10D" onclick="abcdSeat(this)">
								<label>10D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11D" onclick="abcdSeat(this)">
								<label>11D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12D" onclick="abcdSeat(this)">
								<label>12D</label>
							</button>
						</li>
					</ul>
					
					<ul class="line"></ul>
			</div>

        <div id="section2" class="section" style="display: none;"> 
				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1A" onclick="abcdSeat(this)">
							<label>1A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2A" onclick="abcdSeat(this)">
							<label>2A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3A" onclick="abcdSeat(this)">
							<label>3A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4A" onclick="abcdSeat(this)">
							<label>4A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5A" onclick="abcdSeat(this)">
							<label>5A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6A" onclick="abcdSeat(this)">
							<label>6A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7A" onclick="abcdSeat(this)">
							<label>7A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8A" onclick="abcdSeat(this)">
							<label>8A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9A" onclick="abcdSeat(this)">
							<label>9A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10A" onclick="abcdSeat(this)">
							<label>10A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="11A" onclick="abcdSeat(this)">
							<label>11A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12A" onclick="abcdSeat(this)">
							<label>12A</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1B" onclick="abcdSeat(this)">
							<label>1B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2B" onclick="abcdSeat(this)">
							<label>2B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3B" onclick="abcdSeat(this)">
							<label>3B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4B" onclick="abcdSeat(this)">
							<label>4B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5B" onclick="abcdSeat(this)">
							<label>5B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6B" onclick="abcdSeat(this)">
							<label>6B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7B" onclick="abcdSeat(this)">
							<label>7B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8B" onclick="abcdSeat(this)">
							<label>8B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9B" onclick="abcdSeat(this)">
							<label>9B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10B" onclick="abcdSeat(this)">
							<label>10B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value= "11B" onclick="abcdSeat(this)">
							<label>11B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12B" onclick="abcdSeat(this)">
							<label>12B</label>
						</button>
					</li>
				</ul>

				<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1C" onclick="abcdSeat(this)">
								<label>1C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2C" onclick="abcdSeat(this)">
								<label>2C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3C" onclick="abcdSeat(this)">
								<label>3C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4C" onclick="abcdSeat(this)">
								<label>4C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5C" onclick="abcdSeat(this)">
								<label>5C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6C" onclick="abcdSeat(this)">
								<label>6C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7C" onclick="abcdSeat(this)">
								<label>7C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8C" onclick="abcdSeat(this)">
								<label>8C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9C" onclick="abcdSeat(this)">
								<label>9C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10C" onclick="abcdSeat(this)">
								<label>10C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11C" onclick="abcdSeat(this)">
								<label>11C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12C" onclick="abcdSeat(this)">
								<label>12C</label>
							</button>
						</li>
					</ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1D" onclick="abcdSeat(this)">
								<label>1D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2D" onclick="abcdSeat(this)">
								<label>2D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3D" onclick="abcdSeat(this)">
								<label>3D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4D" onclick="abcdSeat(this)">
								<label>4D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5D" onclick="abcdSeat(this)">
								<label>5D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6D" onclick="abcdSeat(this)">
								<label>6D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7D" onclick="abcdSeat(this)">
								<label>7D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8D" onclick="abcdSeat(this)">
								<label>8D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9D" onclick="abcdSeat(this)">
								<label>9D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10D" onclick="abcdSeat(this)">
								<label>10D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11D" onclick="abcdSeat(this)">
								<label>11D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12D" onclick="abcdSeat(this)">
								<label>12D</label>
							</button>
						</li>
					</ul>
					
					<ul class="line"></ul>
			</div>

        <div id="section3" class="section" style="display: none;">
				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1A" onclick="abcdSeat(this)">
							<label>1A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2A" onclick="abcdSeat(this)">
							<label>2A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3A" onclick="abcdSeat(this)">
							<label>3A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4A" onclick="abcdSeat(this)">
							<label>4A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5A" onclick="abcdSeat(this)">
							<label>5A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6A" onclick="abcdSeat(this)">
							<label>6A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7A" onclick="abcdSeat(this)">
							<label>7A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8A" onclick="abcdSeat(this)">
							<label>8A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9A" onclick="abcdSeat(this)">
							<label>9A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10A" onclick="abcdSeat(this)">
							<label>10A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="11A" onclick="abcdSeat(this)">
							<label>11A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12A" onclick="abcdSeat(this)">
							<label>12A</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1B" onclick="abcdSeat(this)">
							<label>1B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2B" onclick="abcdSeat(this)">
							<label>2B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3B" onclick="abcdSeat(this)">
							<label>3B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4B" onclick="abcdSeat(this)">
							<label>4B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5B" onclick="abcdSeat(this)">
							<label>5B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6B" onclick="abcdSeat(this)">
							<label>6B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7B" onclick="abcdSeat(this)">
							<label>7B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8B" onclick="abcdSeat(this)">
							<label>8B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9B" onclick="abcdSeat(this)">
							<label>9B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10B" onclick="abcdSeat(this)">
							<label>10B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value= "11B" onclick="abcdSeat(this)">
							<label>11B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12B" onclick="abcdSeat(this)">
							<label>12B</label>
						</button>
					</li>
				</ul>

				<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1C" onclick="abcdSeat(this)">
								<label>1C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2C" onclick="abcdSeat(this)">
								<label>2C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3C" onclick="abcdSeat(this)">
								<label>3C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4C" onclick="abcdSeat(this)">
								<label>4C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5C" onclick="abcdSeat(this)">
								<label>5C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6C" onclick="abcdSeat(this)">
								<label>6C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7C" onclick="abcdSeat(this)">
								<label>7C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8C" onclick="abcdSeat(this)">
								<label>8C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9C" onclick="abcdSeat(this)">
								<label>9C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10C" onclick="abcdSeat(this)">
								<label>10C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11C" onclick="abcdSeat(this)">
								<label>11C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12C" onclick="abcdSeat(this)">
								<label>12C</label>
							</button>
						</li>
					</ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1D" onclick="abcdSeat(this)">
								<label>1D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2D" onclick="abcdSeat(this)">
								<label>2D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3D" onclick="abcdSeat(this)">
								<label>3D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4D" onclick="abcdSeat(this)">
								<label>4D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5D" onclick="abcdSeat(this)">
								<label>5D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6D" onclick="abcdSeat(this)">
								<label>6D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7D" onclick="abcdSeat(this)">
								<label>7D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8D" onclick="abcdSeat(this)">
								<label>8D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9D" onclick="abcdSeat(this)">
								<label>9D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10D" onclick="abcdSeat(this)">
								<label>10D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11D" onclick="abcdSeat(this)">
								<label>11D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12D" onclick="abcdSeat(this)">
								<label>12D</label>
							</button>
						</li>
					</ul>
					
					<ul class="line"></ul>
			</div>
		
		<div id="section4" class="section" style="display: none;">
				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1A" onclick="abcdSeat(this)">
							<label>1A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2A" onclick="abcdSeat(this)">
							<label>2A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3A" onclick="abcdSeat(this)">
							<label>3A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4A" onclick="abcdSeat(this)">
							<label>4A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5A" onclick="abcdSeat(this)">
							<label>5A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6A" onclick="abcdSeat(this)">
							<label>6A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7A" onclick="abcdSeat(this)">
							<label>7A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8A" onclick="abcdSeat(this)">
							<label>8A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9A" onclick="abcdSeat(this)">
							<label>9A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10A" onclick="abcdSeat(this)">
							<label>10A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="11A" onclick="abcdSeat(this)">
							<label>11A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12A" onclick="abcdSeat(this)">
							<label>12A</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1B" onclick="abcdSeat(this)">
							<label>1B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2B" onclick="abcdSeat(this)">
							<label>2B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3B" onclick="abcdSeat(this)">
							<label>3B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4B" onclick="abcdSeat(this)">
							<label>4B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5B" onclick="abcdSeat(this)">
							<label>5B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6B" onclick="abcdSeat(this)">
							<label>6B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7B" onclick="abcdSeat(this)">
							<label>7B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8B" onclick="abcdSeat(this)">
							<label>8B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9B" onclick="abcdSeat(this)">
							<label>9B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10B" onclick="abcdSeat(this)">
							<label>10B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value= "11B" onclick="abcdSeat(this)">
							<label>11B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12B" onclick="abcdSeat(this)">
							<label>12B</label>
						</button>
					</li>
				</ul>

				<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1C" onclick="abcdSeat(this)">
								<label>1C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2C" onclick="abcdSeat(this)">
								<label>2C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3C" onclick="abcdSeat(this)">
								<label>3C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4C" onclick="abcdSeat(this)">
								<label>4C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5C" onclick="abcdSeat(this)">
								<label>5C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6C" onclick="abcdSeat(this)">
								<label>6C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7C" onclick="abcdSeat(this)">
								<label>7C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8C" onclick="abcdSeat(this)">
								<label>8C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9C" onclick="abcdSeat(this)">
								<label>9C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10C" onclick="abcdSeat(this)">
								<label>10C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11C" onclick="abcdSeat(this)">
								<label>11C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12C" onclick="abcdSeat(this)">
								<label>12C</label>
							</button>
						</li>
					</ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1D" onclick="abcdSeat(this)">
								<label>1D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2D" onclick="abcdSeat(this)">
								<label>2D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3D" onclick="abcdSeat(this)">
								<label>3D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4D" onclick="abcdSeat(this)">
								<label>4D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5D" onclick="abcdSeat(this)">
								<label>5D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6D" onclick="abcdSeat(this)">
								<label>6D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7D" onclick="abcdSeat(this)">
								<label>7D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8D" onclick="abcdSeat(this)">
								<label>8D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9D" onclick="abcdSeat(this)">
								<label>9D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10D" onclick="abcdSeat(this)">
								<label>10D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11D" onclick="abcdSeat(this)">
								<label>11D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12D" onclick="abcdSeat(this)">
								<label>12D</label>
							</button>
						</li>
					</ul>
					
					<ul class="line"></ul>
			</div>
		
		<div id="section5" class="section" style="display: none;">
				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1A" onclick="abcdSeat(this)">
							<label>1A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2A" onclick="abcdSeat(this)">
							<label>2A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3A" onclick="abcdSeat(this)">
							<label>3A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4A" onclick="abcdSeat(this)">
							<label>4A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5A" onclick="abcdSeat(this)">
							<label>5A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6A" onclick="abcdSeat(this)">
							<label>6A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7A" onclick="abcdSeat(this)">
							<label>7A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8A" onclick="abcdSeat(this)">
							<label>8A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9A" onclick="abcdSeat(this)">
							<label>9A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10A" onclick="abcdSeat(this)">
							<label>10A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="11A" onclick="abcdSeat(this)">
							<label>11A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12A" onclick="abcdSeat(this)">
							<label>12A</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1B" onclick="abcdSeat(this)">
							<label>1B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2B" onclick="abcdSeat(this)">
							<label>2B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3B" onclick="abcdSeat(this)">
							<label>3B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4B" onclick="abcdSeat(this)">
							<label>4B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5B" onclick="abcdSeat(this)">
							<label>5B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6B" onclick="abcdSeat(this)">
							<label>6B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7B" onclick="abcdSeat(this)">
							<label>7B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8B" onclick="abcdSeat(this)">
							<label>8B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9B" onclick="abcdSeat(this)">
							<label>9B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10B" onclick="abcdSeat(this)">
							<label>10B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value= "11B" onclick="abcdSeat(this)">
							<label>11B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12B" onclick="abcdSeat(this)">
							<label>12B</label>
						</button>
					</li>
				</ul>

				<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1C" onclick="abcdSeat(this)">
								<label>1C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2C" onclick="abcdSeat(this)">
								<label>2C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3C" onclick="abcdSeat(this)">
								<label>3C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4C" onclick="abcdSeat(this)">
								<label>4C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5C" onclick="abcdSeat(this)">
								<label>5C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6C" onclick="abcdSeat(this)">
								<label>6C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7C" onclick="abcdSeat(this)">
								<label>7C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8C" onclick="abcdSeat(this)">
								<label>8C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9C" onclick="abcdSeat(this)">
								<label>9C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10C" onclick="abcdSeat(this)">
								<label>10C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11C" onclick="abcdSeat(this)">
								<label>11C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12C" onclick="abcdSeat(this)">
								<label>12C</label>
							</button>
						</li>
					</ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1D" onclick="abcdSeat(this)">
								<label>1D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2D" onclick="abcdSeat(this)">
								<label>2D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3D" onclick="abcdSeat(this)">
								<label>3D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4D" onclick="abcdSeat(this)">
								<label>4D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5D" onclick="abcdSeat(this)">
								<label>5D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6D" onclick="abcdSeat(this)">
								<label>6D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7D" onclick="abcdSeat(this)">
								<label>7D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8D" onclick="abcdSeat(this)">
								<label>8D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9D" onclick="abcdSeat(this)">
								<label>9D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10D" onclick="abcdSeat(this)">
								<label>10D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11D" onclick="abcdSeat(this)">
								<label>11D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12D" onclick="abcdSeat(this)">
								<label>12D</label>
							</button>
						</li>
					</ul>
					
					<ul class="line"></ul>
			</div>
		
		<div id="section6" class="section" style="display: none;">
				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1A" onclick="abcdSeat(this)">
							<label>1A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2A" onclick="abcdSeat(this)">
							<label>2A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3A" onclick="abcdSeat(this)">
							<label>3A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4A" onclick="abcdSeat(this)">
							<label>4A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5A" onclick="abcdSeat(this)">
							<label>5A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6A" onclick="abcdSeat(this)">
							<label>6A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7A" onclick="abcdSeat(this)">
							<label>7A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8A" onclick="abcdSeat(this)">
							<label>8A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9A" onclick="abcdSeat(this)">
							<label>9A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10A" onclick="abcdSeat(this)">
							<label>10A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="11A" onclick="abcdSeat(this)">
							<label>11A</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12A" onclick="abcdSeat(this)">
							<label>12A</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" value="1B" onclick="abcdSeat(this)">
							<label>1B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="2B" onclick="abcdSeat(this)">
							<label>2B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="3B" onclick="abcdSeat(this)">
							<label>3B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="4B" onclick="abcdSeat(this)">
							<label>4B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="5B" onclick="abcdSeat(this)">
							<label>5B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="6B" onclick="abcdSeat(this)">
							<label>6B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="7B" onclick="abcdSeat(this)">
							<label>7B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="8B" onclick="abcdSeat(this)">
							<label>8B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="9B" onclick="abcdSeat(this)">
							<label>9B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="10B" onclick="abcdSeat(this)">
							<label>10B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value= "11B" onclick="abcdSeat(this)">
							<label>11B</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" value="12B" onclick="abcdSeat(this)">
							<label>12B</label>
						</button>
					</li>
				</ul>

				<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1C" onclick="abcdSeat(this)">
								<label>1C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2C" onclick="abcdSeat(this)">
								<label>2C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3C" onclick="abcdSeat(this)">
								<label>3C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4C" onclick="abcdSeat(this)">
								<label>4C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5C" onclick="abcdSeat(this)">
								<label>5C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6C" onclick="abcdSeat(this)">
								<label>6C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7C" onclick="abcdSeat(this)">
								<label>7C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8C" onclick="abcdSeat(this)">
								<label>8C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9C" onclick="abcdSeat(this)">
								<label>9C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10C" onclick="abcdSeat(this)">
								<label>10C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11C" onclick="abcdSeat(this)">
								<label>11C</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12C" onclick="abcdSeat(this)">
								<label>12C</label>
							</button>
						</li>
					</ul>

					<ul class="uall">
						<li class="seat-container">
							<button class="seat-button" value="1D" onclick="abcdSeat(this)">
								<label>1D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="2D" onclick="abcdSeat(this)">
								<label>2D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="3D" onclick="abcdSeat(this)">
								<label>3D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="4D" onclick="abcdSeat(this)">
								<label>4D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="5D" onclick="abcdSeat(this)">
								<label>5D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="6D" onclick="abcdSeat(this)">
								<label>6D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="7D" onclick="abcdSeat(this)">
								<label>7D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="8D" onclick="abcdSeat(this)">
								<label>8D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="9D" onclick="abcdSeat(this)">
								<label>9D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="10D" onclick="abcdSeat(this)">
								<label>10D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="11D" onclick="abcdSeat(this)">
								<label>11D</label>
							</button>
						</li>
						<li class="seat-container">
							<button class="seat-button" value="12D" onclick="abcdSeat(this)">
								<label>12D</label>
							</button>
						</li>
					</ul>
					
					<ul class="line"></ul>
			</div>
			<br>
		<div>
		    <span>현재 선택된 좌석:</span> <strong id="sitHo"></strong> <strong id="sitCheck"></strong>
		</div>
        
		
		<form id="seatForm" action="${pageContext.request.contextPath}/seat.do" method="post">
		    <!-- 숨겨진 필드들 -->
		    <input type="hidden" id="selectedSeats" name="selectedSeats">
		    <input type="hidden" id="hocha" name="hocha">
		    <input type="hidden" id="startname" name="startname">
		    <input type="hidden" id="endname" name="endname">
		    <input type="hidden" id="seatType" name="seatType">
		    <input type="hidden" id="startdate" name="startdate">
		    <input type="hidden" id="trainType" name="trainType">
		    <input type="hidden" id="personnelCount" name="personnelCount">
		    <input type="hidden" id="childCount" name="childCount">
		    <input type="hidden" id="trainno" name="trainno">
		    <input type="hidden" id="depTime" name="depTime">
		    <input type="hidden" id="arrTime" name="arrTime">
		    <input type="hidden" id="duration" name="duration">

		    <!-- 버튼 클릭 시 seatForm 함수 호출 -->
		    <input type="submit" id="seatReservation" value="좌석 예매하기">
		</form>



		<script>
			console.log('1: ',selectedSeats);
			console.log('2: ',hocha);
			console.log('3: ',startname);
			console.log('4: ',endname);
			console.log('5: ',seatType);
			console.log('6: ',startdate);
			console.log('7: ',trainType);
			console.log('8: ',personnelCount);
			console.log('9: ',childCount);
			console.log('10: ',trainno);
			console.log('11: ',depTime);
			console.log('12: ',arrTime);
			console.log('13: ',duration);
		</script>
		<br>
    </div>          
</body>
</html>
