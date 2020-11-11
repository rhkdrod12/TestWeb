<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error!!!</title>
<style type="text/css">

	.box{
		height: 1000px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
</style>

</head>
<body>
	
	<div class="box">
		<img alt="error" src="/TestWeb/errorPage/NotFind.gif">
		<div><h3>여기는 에러가 발생되어 이동된 페이지입니다.</h3></div>
		<div><h3><a href="/TestWeb">메인으로 이동하기</a></h3></div>
	</div>

	
</body>
</html>