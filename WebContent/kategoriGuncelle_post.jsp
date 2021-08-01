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

<title>Insert title here</title>
</head>
<body>
<%
	String categoryId = request.getParameter("categoryId");
	String categoryBody = request.getParameter("categoryBody");
	
	String email=(String)session.getAttribute("s_email");
	UserControl userControl = new UserControl();
	
	CategoryControl categoryControl = new CategoryControl();
	
	User user = userControl.kullaniciBul_email(email);
	if(!user.getYetki().equals("0"))
	{
		response.sendRedirect("kategoriler.jsp");
	}
	
	if(categoryId.equals("") || categoryBody.equals(""))
	{
	 	response.sendRedirect("kategoriGuncelle.jsp");
	}
	else
	{
		Category category = new Category(categoryId, categoryBody);
		
		String sonuc = categoryControl.kategoriUpdate(category);
		if(sonuc.equals("k"))
		{
			response.sendRedirect("kategoriler.jsp");
		}
		else
		{
			out.println(sonuc);
		}
	}
	
%>
</body>
</html>