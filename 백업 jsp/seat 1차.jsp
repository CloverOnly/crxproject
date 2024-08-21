<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<title>좌석 선택</title>
	<style>
		.seat-container {
			display: inline-block; /* li를 인라인 블록으로 설정 */
			list-style: none;
			padding: 0;
			margin: 0 5px; /* 버튼 사이의 간격 조정 */
		}
		.seat-button {
		    position: relative;
		    background: url(../img/seat.png) no-repeat center center;
		    background-size: cover;
		    width: 63px;
		    height: 60px;
		    border: none;
		    cursor: pointer;
		    text-align: center;
		}
		.seat-button label {
		    position: absolute;
		    bottom: -19px;
		    left: 50%;
		    transform: translateX(-50%);
		    color: black;
		    font-size: 16px;
		}
		.all{
			width:1000px;
		}
		.uall{
			width:1000px;
		}
		fieldset{
			width:1000px;
		}
		.line{
			border: solid 2px green;
		}
	</style>
	<meta name="viewport" content="width=1000">
</head>
<body>
	<fieldset>
		<legend>좌석 선택</legend>
		<div class="all">
			<ul class="line"></ul>
			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>1a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>2a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>3a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>4a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>5a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>6a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>7a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>8a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>9a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>10a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>11a</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>12a</label>
					</button>
				</li>
			</ul>
			
			<ul class="uall">
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>1b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>2b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>3b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>4b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>5b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>6b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>7b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>8b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>9b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>10b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>11b</label>
					</button>
				</li>
				<li class="seat-container">
					<button class="seat-button" onclick="alert('좌석이 선택되었습니다!')">
						<label>12b</label>
					</button>
				</li>
			</ul>
			
			<br><br>
			
			
		</div>
	</fieldset>
    <script>
       
    </script>
</body>
</html>
