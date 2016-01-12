<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/js/common.js"></script>
<script src="/js/drawing.js"></script>
<title>${ title }</title>
</head>
<body>
	<c:if test="${ pStory ne null }">
		<div id="parentStoryBox">
			<p>${ pStory.title }</p>
			<p>${ pStory.regId }</p>
			<p>${ pStory.regDt }</p>
			<p>
				<img style="width:500px;" src="/img/story/${ pStory.imgName }" />
			</p>
			<p>${ pStory.comment }</p>
		</div>
	</c:if>
	<form:form id="storyForm" method="post" enctype="multipart/form-data" action="${ url }" commandName="story">
		<c:if test="${ pStory ne null }">
			<input type="hidden" name="rseq" value="${ pStory.rseq }" />
			<input type="hidden" name="pseq" value="${ pStory.seq }" />
		</c:if>		
		<input type="hidden" name="imgByte" id="" value="" />
		<c:if test="${ type eq 'U' }">
			<input type="hidden" name="seq" value="${ story.seq }" />
			<input type="hidden" name="imgName" value="${ story.imgName }" />
		</c:if>
		<table>
			<tr>
				<td>
					<input type="text" name="title" value="${ story.title }" />
				</td>
			</tr>
			<tr>	
				<td>
					<input checked="checked" value="canvas" type="radio" name="imgType" />그리기&nbsp;
					<input value="file" type="radio" name="imgType" />이미지파일
					<div id="drawingBox" style="position:relative; width:500px; height:410px;"></div>
					<p><input id="imgFileBox" style="display:none;" type="file" name="img" /></p>
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="comment">${ story.comment }</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<button id="regBtn">save</button>
				</td>
			</tr>
		</table>		
		<c:choose>
			<c:when test="${ type eq 'U' }">
				<input id="txtImgSrc" type="hidden" value="/img/story/${ story.imgName }" />	
			</c:when>
			<c:otherwise>
				<input id="txtImgSrc" type="hidden" value="" />
			</c:otherwise>
		</c:choose>
	</form:form>
</body>

<script>
	$(function() {
		Drawing.init("drawingBox", "drawingCanvas", 550, 350, $("#txtImgSrc").val());

		$("#regBtn").click(function(e) {
			e.preventDefault();
			var canvas = document.getElementById("drawingCanvas");
			var imgData = canvas.toDataURL("image/png");
			imgData = imgData.replace("data:image/png;base64,", "");
			$("input:hidden[name=imgByte]").val(imgData);

			$("#storyForm").submit();
		});

		$("input:radio[name=imgType]").change(function() {
			if($(this).is(":checked")) {
				if($(this).val() == "canvas") {
					$("#drawingBox").show();
					$("#imgFileBox").hide();
				} else {
					$("#imgFileBox").show();
					$("#drawingBox").hide();
				}
			}
		});
	});	
</script>
</html>