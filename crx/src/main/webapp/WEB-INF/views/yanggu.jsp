<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<meta charset="UTF-8">
	<title>양구역</title>
	<style>
		.container {
			margin:auto;
			width: 1200px;
		}
		.header {
		    background-color: rgb(226, 240, 217);
		    text-align: center;
		}
		.CSMainImg {
			width: 1000px;
			height: 500px;
			background-image: url('../img/CSImg.jpg');
			background-size: cover;
		}
		.line {
			margin: 10px 0;
			width:50px;
			height: 50px;
			border-bottom: 5px solid rgb(84, 130, 53);
		}
		li::marker {
			color: rgb(84, 130, 53);			
		}
		hr {
			width: 1200px;
		}

		.subMenu {
		    max-width: 1200px;
		  
		}
		.subMenu2 {
			background-color: rgb(84, 130, 53);
		}
		a {
			display:block;
			text-decoration: none;
			color: white;
		}
		.redFont {
			color: red;
		}
		.row{
			width:1200px;
		}

		.cal {
		    width: 1200px; /* .subMenu와 동일한 너비 */
		    height: 400px;
		    background-image: url('../img/st2.jpg');
		}
		.sInfo{
			width:1200px;
			height: 400px;
			
		}
		.dimg{
			float: left;
			width: 400px;
			height: 100%;
			border-radius: 15px;
		}
		.detail{
			float: right;
			padding: 15px;
			text-align:center;
			width: 795px;
			height: 100%;
		}
		.miniImg{
			width:1200px;
			height: 130px;
			background-image: url('../img/dd.JPG');
		}

	</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="container">
		<h1>양구역</h1>
		
		<hr>
		<div class="subMenu subtle text-center px-2">
			<div class="row">
				<div class="subMenu1 col border border-white bg-secondary ms-1"><a href="hwacheon.do" class="fs-5">화천역</a></div>
				<div class="subMenu2 col border border-white"><a href="yanggu.do" class="fs-5">양구역</a></div>
				<div class="subMenu3 col border border-white bg-secondary"><a href="inje.do" class="fs-5">인제역</a></div>
				<div class="subMenu4 col border border-white bg-secondary"><a href="goseong.do" class="fs-5">고성역</a></div>
				<div class="subMenu5 col border border-white bg-secondary"><a href="sokcho.do" class="fs-5">속초역</a></div>
				<div class="subMenu6 col border border-white bg-secondary"><a href="yangyang.do" class="fs-5">양양역</a></div>					 
			 </div>
		</div>
		<div class="cal my-3"></div>
		<div class="line"></div>
		<div>
				<h4>상세정보</h4>
					<div class="sInfo">
						<div id="map" class="dimg"></div>
						<div class="detail">
							<br>
							<p><h3>우리나라 국토의 배꼽 강원도 양구군.</h3><br><br> 
								한국전쟁 당시 치열한 격전지 중 하나였던 이곳은 오랜 상처를 치유한 듯 생명의 새살이 돋아났다.<br>
								'펀치볼'로 더 알려진 양구 해안분지는 세계적으로도 분지 지형의 대표로 손꼽히며 금강산 가는 길목에 위치한 두타연은 곡류였던 수입천의 흐름이 바위를 뚫고 만들어진 폭포의 모습이 일품이다.<br>
								박수근 화가가 태어나고 잠든 박수근 미술관과 역사적 아픔과 아름다움이 공존하는 파로도도 대표 여행 코스이다.</p>
						</div>
					</div>
					
					<br><br>
					<div class="miniImg"></div>
				</div>		
			</div>

			<br><br><br>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=74433c16b1f2a05d5e948ea7cee3126f"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
			    		center: new kakao.maps.LatLng(38.10193807969793,127.98564863872626), // 지도의 중심좌표
			        		level: 3 // 지도의 확대 레벨
			    	};

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption); 
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(38.10193807969793,127.98564863872626), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(38.10193807969793,127.98564863872626); 

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);	
				</script>
</body>
</html>