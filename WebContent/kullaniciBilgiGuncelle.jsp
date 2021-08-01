<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Cookie adding login page.</title>
</head>
<body>

<%

	String kullanici_adi = request.getParameter("kullanici_adi");
	String kullanici_soyAdi = request.getParameter("kullanici_soyAdi");
	String kullanici_kullaniciAdi = request.getParameter("kullanici_kullaniciAdi");
	String kullanici_sifre = request.getParameter("kullanici_sifre");
	String kullanici_email = request.getParameter("kullanici_email");

	if(kullanici_adi != null && kullanici_soyAdi != null && kullanici_kullaniciAdi != null && kullanici_sifre != null && kullanici_email != null )
	{
		UserControl userControl = new UserControl();
		int yanit = userControl.kullaniciGuncelle(kullanici_adi, kullanici_soyAdi, kullanici_kullaniciAdi, kullanici_sifre, kullanici_email);
		if(yanit > 0)
		{
			response.sendRedirect("homepage.jsp");
		}
		else
		{
			response.sendRedirect("kullaniciAyarlari.jsp");
		}
		
	}
	else{
		response.sendRedirect("kullaniciAyarlari.jsp");
	}

%>

</body>
</html>