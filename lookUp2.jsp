<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>역 명</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<style>
		.lineTitle{
			text-align: center;
			margin-top: 16px;
		}
		.lineAll{
			
		}
	    .Gyeongbu {
			background-image: url(../img/map1.jpg);
		    background-size: cover;
		    position: absolute;
		    left: 158px;
		    width: 54%;
		    height: 521px;
	    }
		.m1{
			position: absolute;
			top: 196px;
			left: 224px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m2{
			position: absolute;
			top: 207px;
			left: 290px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m3{
			position: absolute;
			top: 247px;
			left: 296px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m4{
			position: absolute;
			top: 263px;
			left: 227px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m5{
			position: absolute;
			top: 298px;
			left: 313px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m6{
			position: absolute;
			right: 442px;
			bottom: 272px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m7{
			position: absolute;
			top: 329px;
			left: 205px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m8{
			position: absolute;
			right: 312px;
			bottom: 272px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m9{
			position: absolute;		
			right: 268px;
			bottom: 249px;
			font-size: 12px;
			background-color: blue;
			color: white;
		}
		.m10{
			position: absolute;
			right: 348px;
			bottom: 218px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m11{
			position: absolute;
			right: 323px;
			bottom: 187px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m12{
			position: absolute;
			right: 203px;
			bottom: 257px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m13{
			position: absolute;
			right: 209px;
			bottom: 218px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m14{
			position: absolute;
			right: 214px;
			bottom: 184px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m15{
			position: absolute;
			position: absolute;
			right: 304px;
			bottom: 153px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m16{
			position: absolute;
			right: 235px;
			bottom: 140px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m17{
			position: absolute;
			top: 336px;
			left: 319px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.Honame{
			background-image: url(../img/map2.JPG);
			background-size: cover;
			position: absolute;
			left: 158px;
			width: 54%;
			height: 521px;
		}
		.m18{
			position: absolute;
			top: 238px;
			left: 306px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m19{
			position: absolute;
			left: 235px;
			bottom: 304px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m20{
			position: absolute;
			left: 340px;
			bottom: 293px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m21{
			position: absolute;
			left: 252px;
			bottom: 273px;
			font-size: 12px;
			background-color: blue;
			color: white;
		}
		.m22{
			position: absolute;
			left: 327px;
			bottom: 264px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m23{
			position: absolute;
			left: 225px;
			bottom: 249px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m24{
			position: absolute;
			left: 213px;
			bottom: 210px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m25{
			position: absolute;
			left: 281px;
			bottom: 151px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m26{
			position: absolute;
			left: 252px;
			bottom: 118px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m27{
			position: absolute;
			left: 182px;
			bottom: 91px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.Gyeonjeon{
			background-image: url(../img/map3.jpg);
			background-size: cover;
			position: absolute;
    		left: 151px;			
			width: 54%;
			height: 521px;
		}
		.m28{
			position: absolute;
			right: 267px;
			bottom: 173px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m29{
			position: absolute;
			right: 252px;
			bottom: 146px;
			font-size: 13px;
			background-color: blue;
			color: white;
		}
		.m30{
			position: absolute;
			right: 361px;
			bottom: 165px;
			font-size: 12px;
			background-color: blue;
			color: white;
		}
		.m31{
			position: absolute;
			right: 332px;
			bottom: 127px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m32{
			position: absolute;
			right: 399px;
			bottom: 139px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.Jeolla{
			background-image: url(../img/map4.jpg);
			background-size: cover;
			position: absolute;
			left: 158px;
			width: 54%;
			height: 521px;
		}
		.m33{
			position: absolute;
			left: 312px;
			bottom: 234px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m34{
			position: absolute;
			left: 328px;
			bottom: 195px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m35{
			position: absolute;
			left: 265px;
			bottom: 163px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m36{
			position: absolute;
			left: 332px;
			bottom: 147px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m37{
			position: absolute;
			left: 276px;
			bottom: 109px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m38{
			position: absolute;
			left: 348px;
			bottom: 108px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}
		.m39{
			position: absolute;
			left: 342px;
			bottom: 71px;
			font-size: 14px;
			background-color: blue;
			color: white;
		}

	</style>
</head>
<body>
		<div class="lineAll">
			<div class=lineTitle>
				<h3><strong>KTX</strong></h3>
				<hr>
			</div>
			<nav>
			    <div class="nav nav-tabs" id="nav-tab" role="tablist">
			    	<button class="nav-link active" id="nav-Gyeongbu-tab" data-bs-toggle="tab" data-bs-target="#nav-Gyeongbu" type="button" role="tab" aria-controls="nav-Gyeongbu" aria-selected="true">경부선</button>
			    	<button class="nav-link" id="nav-Honame-tab" data-bs-toggle="tab" data-bs-target="#nav-Honame" type="button" role="tab" aria-controls="nav-Honame" aria-selected="false">호남선</button>
			    	<button class="nav-link" id="nav-Gyeonjeon-tab" data-bs-toggle="tab" data-bs-target="#nav-Gyeonjeon" type="button" role="tab" aria-controls="nav-Gyeonjeon" aria-selected="false">경전선</button>
					<button class="nav-link" id="nav-Jeolla-tab" data-bs-toggle="tab" data-bs-target="#nav-Jeolla" type="button" role="tab" aria-controls="nav-Jeolla" aria-selected="true">전라선</button>
					<button class="nav-link" id="nav-Gangneung-tab" data-bs-toggle="tab" data-bs-target="#nav-Gangneung" type="button" role="tab" aria-controls="nav-Gangneung" aria-selected="false">강릉선</button>
					<button class="nav-link" id="nav-jungang-tab" data-bs-toggle="tab" data-bs-target="#nav-jungang" type="button" role="tab" aria-controls="nav-jungang" aria-selected="false">중앙선</button>
					<button class="nav-link" id="nav-Jungbunaeryuk-tab" data-bs-toggle="tab" data-bs-target="#nav-Jungbunaeryuk" type="button" role="tab" aria-controls="nav-Jungbunaeryuk" aria-selected="false">중부내륙선</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
			    <div class="tab-pane fade show active" id="nav-Gyeongbu" role="tabpanel" aria-labelledby="nav-Gyeongbu-tab" tabindex="0">
					<div>
						<div class="Gyeongbu"></div>
						<input type="button" name="stationName" class="m1" onclick="setParentText(this)" value="행신역" data-value="NAT110147">  
						<input type="button" name="stationName" class="m2" onclick="setParentText(this)" value="서울역" data-value="NAT010000">  
						<input type="button" name="stationName" class="m3" onclick="setParentText(this)" value="영등포역" data-value="NAT010091">  
						<input type="button" name="stationName" class="m4" onclick="setParentText(this)" value="광명역" data-value="NATH10219">  
						<input type="button" name="stationName" class="m5" onclick="setParentText(this)" value="수원역" data-value="NAT010415">  
						<input type="button" name="stationName" class="m6" onclick="setParentText(this)" value="대전역" data-value="NAT011668">  
						<input type="button" name="stationName" class="m7" onclick="setParentText(this)" value="천안아산역" data-value="NATH10960">  
						<input type="button" name="stationName" class="m8" onclick="setParentText(this)" value="김천역" data-value="NAT012546">  
						<input type="button" name="stationName" class="m9" onclick="setParentText(this)" value="동대구역" data-value="NAT013271">  
						<input type="button" name="stationName" class="m10" onclick="setParentText(this)" value="서대구역" data-value="NAT013189">  
						<input type="button" name="stationName" class="m11" onclick="setParentText(this)" value="밀양역" data-value="NAT013841">  
						<input type="button" name="stationName" class="m12" onclick="setParentText(this)" value="포항역" data-value="NAT8B0351">  
						<input type="button" name="stationName" class="m13" onclick="setParentText(this)" value="경주역" data-value="NAT023821">  
						<input type="button" name="stationName" class="m14" onclick="setParentText(this)" value="울산역" data-value="NATH13717">  
						<input type="button" name="stationName" class="m15" onclick="setParentText(this)" value="구포역" data-value="NAT014281">  
						<input type="button" name="stationName" class="m16" onclick="setParentText(this)" value="부산역" data-value="NAT014445">
						<input type="button" name="stationName" class="m17" onclick="setParentText(this)" value="오송역" data-value="NAT050044">  

					</div>	
				</div>
			    <div class="tab-pane fade" id="nav-Honame" role="tabpanel" aria-labelledby="nav-Honame-tab" tabindex="0">
					<div class="tab-pane fade show active" id="nav-Gyeongbu" role="tabpanel" aria-labelledby="nav-Gyeongbu-tab" tabindex="0">
						<div class="Honame"></div>
						<input type="button" name="stationName" class="m1" onclick="setParentText(this)" value="행신역" data-value="NAT110147">  
						<input type="button" name="stationName" class="m18" onclick="setParentText(this)" value="용산역" data-value="NAT010032">  
						<input type="button" name="stationName" class="m4" onclick="setParentText(this)" value="광명역" data-value="NATH10219">  
						<input type="button" name="stationName" class="m7" onclick="setParentText(this)" value="천안아산역" data-value="NATH10960">  
						<input type="button" name="stationName" class="m17" onclick="setParentText(this)" value="오송역" data-value="NAT050044">  
						<input type="button" name="stationName" class="m19" onclick="setParentText(this)" value="공주역" data-value="NATH20438">  
						<input type="button" name="stationName" class="m20" onclick="setParentText(this)" value="서대전역" data-value="NAT030057">  
						<input type="button" name="stationName" class="m21" onclick="setParentText(this)" value="논산역" data-value="NAT030508">  
						<input type="button" name="stationName" class="m22" onclick="setParentText(this)" value="계룡역" data-value="NAT030254">  
						<input type="button" name="stationName" class="m23" onclick="setParentText(this)" value="익산역" data-value="NAT030879">  
						<input type="button" name="stationName" class="m24" onclick="setParentText(this)" value="정읍역" data-value="NAT031314">  
						<input type="button" name="stationName" class="m25" onclick="setParentText(this)" value="광주송정역" data-value="NAT031857">  
						<input type="button" name="stationName" class="m26" onclick="setParentText(this)" value="나주역" data-value="NAT031998">  
						<input type="button" name="stationName" class="m27" onclick="setParentText(this)" value="목포역" data-value="NAT032563">	
					</div>
				</div>
			    <div class="tab-pane fade" id="nav-Gyeonjeon" role="tabpanel" aria-labelledby="nav-Gyeonjeon-tab" tabindex="0">
					<div class="Gyeonjeon"></div>
					<input type="button" name="stationName" class="m1" onclick="setParentText(this)" value="행신역" data-value="NAT110147">  
					<input type="button" name="stationName" class="m2" onclick="setParentText(this)" value="서울역" data-value="NAT010000">  
					<input type="button" name="stationName" class="m4" onclick="setParentText(this)" value="광명역" data-value="NATH10219">  
					<input type="button" name="stationName" class="m7" onclick="setParentText(this)" value="천안아산역" data-value="NATH10960">  
					<input type="button" name="stationName" class="m17" onclick="setParentText(this)" value="오송역" data-value="NAT050044">  
					<input type="button" name="stationName" class="m6" onclick="setParentText(this)" value="대전역" data-value="NAT011668">  
					<input type="button" name="stationName" class="m8" onclick="setParentText(this)" value="김천역" data-value="NAT012546">  
					<input type="button" name="stationName" class="m9" onclick="setParentText(this)" value="동대구역" data-value="NAT013271">  
					<input type="button" name="stationName" class="m10" onclick="setParentText(this)" value="서대구역" data-value="NAT013189">  
					<input type="button" name="stationName" class="m11" onclick="setParentText(this)" value="밀양역" data-value="NAT013841">  
					<input type="button" name="stationName" class="m28" onclick="setParentText(this)" value="진영역" data-value="NAT880177">  
					<input type="button" name="stationName" class="m29" onclick="setParentText(this)" value="창원중앙역" data-value="NAT880281">  
					<input type="button" name="stationName" class="m30" onclick="setParentText(this)" value="창원역" data-value="NAT880310">  
					<input type="button" name="stationName" class="m31" onclick="setParentText(this)" value="마산역" data-value="NAT880345">  
					<input type="button" name="stationName" class="m32" onclick="setParentText(this)" value="진주역" data-value="NAT881014">	
				</div>
				<div class="tab-pane fade" id="nav-Jeolla" role="tabpanel" aria-labelledby="nav-Jeolla-tab" tabindex="0">
					<div class="Jeolla"></div>	
					<input type="button" name="stationName" class="m1" onclick="setParentText(this)" value="행신역" data-value="NAT110147">  
					<input type="button" name="stationName" class="m18" onclick="setParentText(this)" value="용산역" data-value="NAT010032">  
					<input type="button" name="stationName" class="m4" onclick="setParentText(this)" value="광명역" data-value="NATH10219">  
					<input type="button" name="stationName" class="m7" onclick="setParentText(this)" value="천안아산역" data-value="NATH10960">  
					<input type="button" name="stationName" class="m17" onclick="setParentText(this)" value="오송역" data-value="NAT050044">  
					<input type="button" name="stationName" class="m19" onclick="setParentText(this)" value="공주역" data-value="NATH20438">  
					<input type="button" name="stationName" class="m21" onclick="setParentText(this)" value="논산역" data-value="NAT030508">  
					<input type="button" name="stationName" class="m20" onclick="setParentText(this)" value="서대전역" data-value="NAT030057">  
					<input type="button" name="stationName" class="m22" onclick="setParentText(this)" value="계룡역" data-value="NAT030254">  
					<input type="button" name="stationName" class="m23" onclick="setParentText(this)" value="익산역" data-value="NAT030879">  
					<input type="button" name="stationName" class="m33" onclick="setParentText(this)" value="전주역" data-value="NAT040257">  
					<input type="button" name="stationName" class="m34" onclick="setParentText(this)" value="남원역" data-value="NAT040868">  
					<input type="button" name="stationName" class="m35" onclick="setParentText(this)" value="곡성역" data-value="NAT041072">  
					<input type="button" name="stationName" class="m36" onclick="setParentText(this)" value="구례구역" data-value="NAT041285">  
					<input type="button" name="stationName" class="m37" onclick="setParentText(this)" value="순천역" data-value="NAT041595">  
					<input type="button" name="stationName" class="m38" onclick="setParentText(this)" value="여천역" data-value="NAT041866">  
					<input type="button" name="stationName" class="m39" onclick="setParentText(this)" value="여수엑스포역" data-value="NAT041993">
				</div>
				<div class="tab-pane fade" id="nav-Gangneung" role="tabpanel" aria-labelledby="nav-Gangneung-tab" tabindex="0">
					<div class="Gangneung">
						<input type="button" name="stationName" class="ccInput" onclick="setParentText(this)" value="행신역" data-value="NAT110147">  

					</div>	
				</div>
				<div class="tab-pane fade" id="nav-jungang" role="tabpanel" aria-labelledby="nav-jungang-tab" tabindex="0">
					<div class="jungang">
						<input type="button" name="stationName" class="ccInput" onclick="setParentText(this)" value="행신역" data-value="NAT110147">  

					</div>	
				</div>
				<div class="tab-pane fade" id="nav-Jungbunaeryuk" role="tabpanel" aria-labelledby="nav-Jungbunaeryuk-tab" tabindex="0">
					<div class="Jungbunaeryuk">
						<input type="button" name="stationName" class="ccInput" onclick="setParentText(this)" value="행신역" data-value="NAT110147">  

					</div>	
				</div>
			</div>
		</div>
	
	<script>
		function setParentText(buttonElement) {
		    if (opener && !opener.closed) { // 부모 창이 열려 있는지 확인
		        var parentInput = opener.document.getElementById("arrplacename");
		        var hiddenField = opener.document.getElementById("arrPlaceIdHidden");
		        
		        if (parentInput) {
		            parentInput.value = buttonElement.getAttribute('value'); // 버튼의 value 값을 부모 창의 입력 필드에 설정
		        }
		        
		        if (hiddenField) {
		            hiddenField.value = buttonElement.getAttribute('data-value'); // 버튼의 data-value 값을 hiddenField에 설정
		        }
		        
		        console.log('Selected data-value:', buttonElement.getAttribute('data-value')); // 클릭된 버튼의 data-value를 콘솔에 출력
		        
		        window.close(); // 자식 창 닫기
		    } else {
		        alert("부모 창을 찾을 수 없습니다.");
		    }
		}
	</script>
</body>
</html>
