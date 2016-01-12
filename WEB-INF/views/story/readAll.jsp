<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input id="rootSeq" type="hidden" value="${ rseq }" />
	<div id="storiesBox">
		
	</div>	
	
	<div id="hiddenStoryBox" style="display:none;">		
		<div class="oneStoryBox" style="float:left;">
			<p id="title"></p>
			<p id="regId"></p>
			<p id="regDt"></p>
			<p>
				<img id="img" style="width:500px;" src="" />
			</p>
			<p id="comment"></p>
		</div>		
	</div>
</body>
<script src="/js/common.js"></script>
<script src="/js/story/readAll.js"></script>
<Script>
	$(function() {
		ReadAll.init();
	});
</Script>
</html>