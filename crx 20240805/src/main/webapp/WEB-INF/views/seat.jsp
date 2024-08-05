<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<title>Child</title>
	<style>
		
	</style>
</head>
<body>
    <br>
    <b><font size="5" color="gray">역 명</font></b>
    <br><br>
 
	 <button class="se" type="button" onclick="setParentText(this)"><i class="bi bi-archive">a1</i></button>
	 
	
    <br><br>
    <script>
        function setParentText(button) {
            var parentInput = opener.document.getElementById("arrplacename");
            parentInput.value = button.textContent;
            window.close(); // 클릭 후 자식 창 닫기
        }
    </script>
</body>
</html>

