<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="com.forum.classes.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<title>Insert title here</title>
</head>
<body>
<%
PostControl postControl = new PostControl();
	List<Post> Posts = postControl.tumGonderileriDondur();
	PostsPdf firstPdf = new PostsPdf();
	if(firstPdf.calistir(Posts).equals("sorun yok"))
	{
		response.sendRedirect("homepage.jsp");
	}
%>
</body>
</html>