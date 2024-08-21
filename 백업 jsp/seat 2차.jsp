<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>좌석 선택</title>
    <style>
        body{
            margin: 0;
        }
        .seat-container {
            display: inline-block; /* li를 인라인 블록으로 설정 */
            list-style: none;
            padding: 0;
            margin: 0 5px; /* 버튼 사이의 간격 조정 */
        }
        .seat-button {
            position: relative;
            background: url(../img/seat2.jpg) no-repeat center center;
            background-size: 63%;
            width: 63px;
            height: 60px;
            border: none;
            cursor: pointer;
            text-align: center;
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

        .line{
            border: solid 2px green;
        }
        .seatAll{
            border-width: 10px 5px 5px 5px; /* 상 우 하 좌 순서 */
            border-style: solid; /* 테두리 스타일 */
            border-color: green; /* 테두리 색상 */    
        }
        .seatTitle {
            background: green;
            color: white;
            width: 100%;
            height: 60px; /* 높이를 조정하여 제목이 화면에 맞도록 설정 */
            text-align: center;
            line-height: 60px; /* 높이와 같은 값으로 설정하여 수직 가운데 정렬 */
            margin: 1;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .uall{
            margin: -14px;
        }
        .hoBa{
            background: url(../img/train.png) no-repeat center center;
            background-size: cover;
            height: 110px;
        }
        .ho{
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

        .cre{
            position: relative;
            left: 99%;
            top: -15px;
            font-size: 21px;
            background-repeat: repeat-x;
            color: green;
        }
        #seatReservation{
            background: green;
            color: white;
            float: right;
            border: 1px solid green; /* 수정된 부분 */
            border-radius: 10px;
            padding: 6px;
        }
        .tli{
            font-size: 12px;
        }
        .fie{
            width: 950px;
        }
        .centered-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
		.inf{
			float: right;
		}
    </style>
    <meta name="viewport" content="width=1000">
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
                        <button class="hocha" onclick="alert('좌석이 선택되었습니다!')">
                            <label>1호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" onclick="alert('좌석이 선택되었습니다!')">
                            <label>2호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" onclick="alert('좌석이 선택되었습니다!')">
                            <label>3호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" onclick="alert('좌석이 선택되었습니다!')">
                            <label>4호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" onclick="alert('좌석이 선택되었습니다!')">
                            <label>5호차</label>
                        </button>
                    </li>
                    <li class="ho">
                        <button class="hocha" onclick="alert('좌석이 선택되었습니다!')">
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
    
		<ul class="uall">
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>1A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>2A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>3A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>4A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>5A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>6A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>7A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>8A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>9A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>10A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>11A</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>12A</label>
				</button>
			</li>
		</ul>

		<ul class="uall">
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>1B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>2B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>3B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>4B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>5B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>6B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>7B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>8B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>9B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>10B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>11B</label>
				</button>
			</li>
			<li class="seat-container">
				<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
					<label>12B</label>
				</button>
			</li>
		</ul>
        
        <ul class="line2"><i class="cre bi bi-chevron-double-right"></i></ul>
        
				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>1C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>2C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>3C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>4C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>5C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>6C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>7C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>8C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>9C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>10C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>11C</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>12C</label>
						</button>
					</li>
				</ul>

				<ul class="uall">
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>1D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>2D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>3D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>4D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>5D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>6D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>7D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>8D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>9D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>10D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>11D</label>
						</button>
					</li>
					<li class="seat-container">
						<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
							<label>12D</label>
						</button>
					</li>
				</ul>
        
        <ul class="line"></ul>
        <div>
            <input type="button" id="seatReservation" name="seatReservation" value="좌석 예매하기" onchange="#()">
        </div>
    </div>                
</body>
</html>

