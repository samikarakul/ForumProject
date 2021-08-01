<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="com.forum.classes.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" >

<title>Insert title here</title>
</head>
<body>
<%
	String postId = request.getParameter("id");
	String userId = request.getParameter("userId");
	String categoryId = request.getParameter("categories");
	String postBody = request.getParameter("postBody");
	String email=(String)session.getAttribute("s_email");
	UserControl userControl = new UserControl();
	
	if(postId.equals("") || userId.equals("") || categoryId.equals("") | postBody.equals(""))
	{
	 	response.sendRedirect("postDuzenle.jsp");
	}
	else
	{
		PostControl postControl = new PostControl();
		int sonuc = postControl.postDuzenle(postId, userId, categoryId, postBody);
		if(sonuc > 0)
		{
			User user = userControl.kullaniciBul_email(email);
			if(user.getYetki().equals("0"))
			{
				response.sendRedirect("homepage.jsp");
			}
			else
			{
				response.sendRedirect("gonderilerim.jsp");
			}
		}
		else
		{
			response.sendRedirect("homepage.jsp");
		}
	}
	
%>

	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>