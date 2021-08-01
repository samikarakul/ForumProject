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
	String userId = request.getParameter("userId");
	String userAdi = request.getParameter("userAdi");
	String userSoyadi = request.getParameter("userSoyadi");
	String userKullaniciAdi = request.getParameter("userKullaniciAdi");
	String userKullaniciEmail = request.getParameter("userKullaniciEmail");
	
	if(!userId.equals("") && !userAdi.equals("") && !userSoyadi.equals("") && !userKullaniciAdi.equals("") && !userKullaniciEmail.equals(""))
	{

		UserControl userControl = new UserControl();
		User user = new User();
		user.setId(userId);
		user.setAdi(userAdi);
		user.setSoyadi(userSoyadi);
		user.setKullaniciAdi(userKullaniciAdi);
		user.setEmail(userKullaniciEmail);
		
		String sonuc = userControl.kullaniciGuncelle_yonetici(user);
		if(sonuc.equals("k"))
		{
			response.sendRedirect("kullanicilar.jsp");
		}
		else
		{
			out.println(sonuc);
		}
	}
	else
	{
		out.println("Eksik değer var");
	}
	
	
	
%>
</body>
</html>