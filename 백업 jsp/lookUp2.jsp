<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Child</title>
</head>
<body>
    <br>
    <b><font size="5" color="gray">역 명</font></b>
    <br><br>
 
    <button class="ccInput" onclick="setParentText(this)">대전</button>  
    <button class="ccInput" onclick="setParentText(this)">서울</button>  
    <button class="ccInput" onclick="setParentText(this)">울산</button>  
    <button class="ccInput" onclick="setParentText(this)">강원도</button>  
    <button class="ccInput" onclick="setParentText(this)">대천</button>  
	
    <br><br>
    <script>
        function setParentText(button) {
            var parentInput = opener.document.getElementById("depplacename");
            parentInput.value = button.textContent;
            window.close(); // 클릭 후 자식 창 닫기
        }
    </script>
</body>
</html>
