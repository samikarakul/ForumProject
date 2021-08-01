<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.forum.javacontrols.*" %>

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
String email=(String)session.getAttribute("s_username");
UserControl userControl = new UserControl();
String userId = request.getParameter("userId");

if(userControl.kullaniciBul_email(email).getYetki().equals("0"))
{
	response.sendRedirect("kategoriler.jsp");
}

if(!userId.equals("") )
{
	String sonuc = userControl.kullaniciSil_admin(userId);
	if(sonuc.equals("k"))
	{
		response.sendRedirect("kullanicilar.jsp");
	}
	else
	{
		out.println(sonuc);
	}
}

%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>