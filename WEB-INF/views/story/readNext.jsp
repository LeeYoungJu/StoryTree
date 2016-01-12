<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="storiesBox">
		<c:forEach var="story" items="${ storyList }">
			<div class="storyBox" style="float:left;">
				<p id="title">${ story.title }</p>
				<p id="regId">${ story.regId }</p>
				<p id="regDt">${ story.regDt }</p>
				<p>
					<img id="img" style="width:500px;" src="/img/story/${ story.imgName }" />
				</p>
				<p id="comment">${ story.comment }</p>
				<p>					
					<a href="/update?seq=${ story.seq }">update</a>
					<a href="/storyList">list</a>
					<a href="/writeNext?rSeq=${ story.rseq }&pSeq=${ story.seq }">write next</a>
					<a href="/readPrev?pseq=${ story.pseq }">prev</a>
					<a href="/readNext?pseq=${ story.seq }">next</a>
					<a href="/readAll?rseq=${ story.rseq }">read all</a>
				</p>
			</div>			
		</c:forEach>		
	</div>
</body>
</html>