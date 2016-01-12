<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="/write">스토리 작성</a>
	</div>
	<table>
		<c:forEach var="story" items="${ stories }">
			<tr>
				<td>${ story.seq }</td>
				<td><a href="/storyRead?seq=${ story.seq }">${ story.title }</a></td>
				<td>${ story.regDt }</td>
				<td>${ story.regId }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>