<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%
	String comment_id = request.getParameter("commentId");
	String post_id = request.getParameter("postId");
	
	
	CommentControl commentControl = new CommentControl();
	int sonuc = commentControl.yorumSil(comment_id);
	if(sonuc > 0)
	{
		%>
		<form action="postdetay.jsp" method="post" id="comPostDetay">
			<input type="hidden" name="id" value="<%= post_id %>"/>
		</form>
		<script>
			document.getElementById("comPostDetay").submit() 
		</script>
		<%
	}
	else
	{
		out.println(post_id);
		out.println(comment_id);
	}
	
%>

</body>
</html>