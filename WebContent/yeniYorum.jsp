<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Yeni yorum</title>
</head>
<body>

<%

	String postId = request.getParameter("postId");
	String userId = request.getParameter("userId");
	String commentBody = request.getParameter("comment_body");

	CommentControl commentControl = new CommentControl();
	int sonuc = commentControl.yeniYorumEkle(postId, userId, commentBody);
	if(sonuc > 0)
	{
		%>
		<form action="postdetay.jsp" method="post" id="frmPostDetay">
			<input type="hidden" name="id" value="<%= postId %>"/>
		</form>
		<script>
			document.getElementById("frmPostDetay").submit() 
		</script>
		<%
	}
	else
	{
		response.sendRedirect("homepage.jsp");
	}
	
%>

</body>
</html>