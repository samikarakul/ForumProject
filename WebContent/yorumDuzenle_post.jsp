<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Yorum Düzenle</title>
</head>
<body>
<%
	String comment_id = request.getParameter("commentId");
	String post_id = request.getParameter("postId");
	String comment_body = request.getParameter("commentBody");
	
	CommentControl commentControl = new CommentControl();
	String sonuc = commentControl.commentUpdate(comment_id, comment_body);
	if(sonuc.equals("yok"))
	{
		%>
		<form action="postdetay.jsp" method="post" id="comDelPostDetay">
			<input type="hidden" name="id" value="<%= post_id %>"/>
		</form>
		<script>
			document.getElementById("comDelPostDetay").submit() 
		</script>
		<%
	}
	else
	{
		out.println(post_id);
		out.println(comment_id + "\n");
		out.println(comment_body + "  XXXX  ");
		out.println(sonuc);
		
		
	}
	
%>
</body>
</html>