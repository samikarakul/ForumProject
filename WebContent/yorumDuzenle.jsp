<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Yorum Düzenle</title>
</head>
<body>
<%@include file='navbar.jsp'%>
<%
	String comment_id = request.getParameter("commentId");
	String post_id = request.getParameter("postId");	
	String comment_body = request.getParameter("commentBody");
%>
<script>
	function dogrula() {
	    var commentBody = document.forms["yorumduzenleform"]["commentBody"].value;
	    
	    var hatalar = "";
	    var dogrulama = true;
	    
	    if (commentBody == null || commentBody == ""){
	    	hatalar += " Yorum Kısmını Boş geçtiniz!";
	        dogrulama = false;
	    }

	    
	}
</script>

	<div class="container mx-auto my-3">
		<form action="yorumDuzenle_post.jsp" method="post" name = "yorumduzenleform" onsubmit="return dogrula()">
	 		<input type="hidden" name="commentId" value="<%= comment_id %>"/>
	 		<input type="hidden" name="postId" value="<%= post_id %>"/>
	 		<textarea class="form-control" name="commentBody"><%= comment_body %></textarea>
	 		<button class="btn btn-primary">Düzenle</button>
	 	</form>
	</div>
 	
</body>
</html>