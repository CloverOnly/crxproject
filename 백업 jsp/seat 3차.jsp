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
            top: 26px;
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
            margin-bottom: 12px;
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
		
		function toggleSeat(sectionId, buttonElement) {
		    // 모든 호차 버튼에서 'selected' 클래스를 제거
		    document.querySelectorAll('.hocha').forEach(function(button) {
		        button.classList.remove('selected');
		    });
		    
		    // 모든 섹션을 숨기기
		    document.querySelectorAll('.section').forEach(function(section) {
		        section.style.display = 'none';
		    });

		    // 선택된 호차 버튼에 'selected' 클래스 추가
		    buttonElement.classList.add('selected');

		    // 선택된 섹션을 보이기
		    document.getElementById(sectionId).style.display = 'block';
		}

		// 페이지가 로드될 때 자동으로 1호차를 선택하도록 설정
		window.onload = function() {
		    const firstSectionButton = document.querySelector('.hocha[data-section="section1"]');
		    if (firstSectionButton) {
		        toggleSeat('section1', firstSectionButton);
		    }
		}
		
		
		function abcdSeat(buttonElement) {
		    // 이미 선택된 좌석인지 확인
		    const isSelected = buttonElement.classList.contains('selected');

		    // 모든 좌석 버튼에서 선택된 상태를 제거
		    document.querySelectorAll('.seat-button').forEach(function(button) {
		        button.classList.remove('selected');
		    });

		    // 선택된 좌석이 아니라면 현재 버튼에 'selected' 클래스 추가
		    if (!isSelected) {
		        buttonElement.classList.add('selected');
		    }
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
            <span>선택좌석</span> <span>선택불가</span> <span>선택가능</span>
        </div>
        <br>
        
        <ul class="line"></ul>
        
        <div id="section1" class="section" style="display: block;">  
			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12A</label>
					</button>
				</li>
			</ul>

			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12B</label>
					</button>
				</li>
			</ul>

			<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12C</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12D</label>
						</button>
					</li>
				</ul>
				
				<ul class="line"></ul>
        </div>

        <div id="section2" class="section" style="display: none;"> 
			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12A</label>
					</button>
				</li>
			</ul>

			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12B</label>
					</button>
				</li>
			</ul>

			<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12C</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12D</label>
						</button>
					</li>
				</ul>
				
				<ul class="line"></ul>
        </div>

        <div id="section3" class="section" style="display: none;">
			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12A</label>
					</button>
				</li>
			</ul>

			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12B</label>
					</button>
				</li>
			</ul>

			<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12C</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12D</label>
						</button>
					</li>
				</ul>
				
				<ul class="line"></ul>
        </div>
		
		<div id="section4" class="section" style="display: none;">
			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12A</label>
					</button>
				</li>
			</ul>

			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12B</label>
					</button>
				</li>
			</ul>

			<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12C</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12D</label>
						</button>
					</li>
				</ul>
				
				<ul class="line"></ul>
        </div>
		
		<div id="section5" class="section" style="display: none;">
			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12A</label>
					</button>
				</li>
			</ul>

			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12B</label>
					</button>
				</li>
			</ul>

			<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12C</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12D</label>
						</button>
					</li>
				</ul>
				
				<ul class="line"></ul>
        </div>
		
		<div id="section6" class="section" style="display: none;">
			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11A</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12A</label>
					</button>
				</li>
			</ul>

			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>1B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>2B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>3B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>4B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>5B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>6B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>7B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>8B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>9B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>10B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>11B</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="abcdSeat(this)">
						<label>12B</label>
					</button>
				</li>
			</ul>

			<ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12C</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>1D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>2D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>3D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>4D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>5D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>6D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>7D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>8D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>9D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>10D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>11D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="abcdSeat(this)">
							<label>12D</label>
						</button>
					</li>
				</ul>
				
				<ul class="line"></ul>
        </div>
		<div>
			<span>현재 선택된 좌석:</span>
		</div>
        
        <div class="butt">
            <input type="button" id="seatReservation" name="seatReservation" value="좌석 예매하기" onchange="#()">
        </div>
    </div>                
</body>
</html>
