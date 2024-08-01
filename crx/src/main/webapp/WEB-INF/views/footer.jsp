<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>푸터</title>
<style>
	.footer{
		width: 100%;
		border-top: 1px dotted gray;
		background-color: rgb(226, 240, 217);
		display:flex;
		align-items: center;
	}
	.crx{
		margin-left:10%;
	}
	.service{
		margin-left: 10px;
		position: relative;
		
	}
	.link{
		position: relative;
		left: 40%;
	}
</style>
</head>
<body> 
	<div class="footer">
		<img src="../img/logo.gif" style="width:250px;" class="crx">
		<div class="service">
			<h6>상호: 주식회사 씨알엑스<br>
				대표자: 추승보, 김의겸, 이영진, 오동수<br>
				사업자등록: 000-11-222222<br>
				통신판매업신고: 2024-대전서구-1005호<br>
				Copyright 2024. CRX INC. All rights reserved.
			</h6>
		</div>
		<div class="service">
			<h6>고객센터<br>
				대표전화: 1005-1005
			</h6>
		</div>
		<div class="link">
			<a href="https://www.letskorail.com/" target='_blank'><img src="../img/ktx.gif" style="width:50px;" alt="ktx"></a>
			<a href="https://etk.srail.kr/" target='_blank'><img src="../img/srt.gif" style="width:50px;" alt="srt"></a>
			<a href="https://www.instagram.com/greenart_official/?igshid=YmMyMTA2M2Y%3D" target='_blank'><img src="../img/insta.gif" style="width:50px" alt="insta"></a>
		<div>
	</div>
</body>
</html>