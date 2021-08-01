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
	UserControl userControl = new UserControl();
	List<User> Users = userControl.KullanicilariGetir();
	UsersPdf usersPdf = new UsersPdf();
	if(usersPdf.calistir(Users).equals("sorun yok"))
	{
		response.sendRedirect("kullanicilar.jsp");
	}
%>
</body>
</html>