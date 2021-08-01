<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="com.forum.classes.*" %>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Cookie adding login page.</title>
</head>
<body>

<%
	String ad=request.getParameter("ad");
	String soyad=request.getParameter("soyad");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String email=request.getParameter("email");
	
	String hatalar = "";
	
	if(ad!=null && soyad!=null && username!=null && password!=null && email!=null)
	{
		if(password.length() >= 6)
		{
			UserControl userControl = new UserControl();
			User user = userControl.kullaniciBul_email(email);
			if(user.getId().equals(""))
			{
				boolean sonuc = userControl.kullaniciEkle(ad,soyad,username,password,email);
				if(sonuc)
				{
					String mailGonderSonuc = userControl.onayEmailiGonder(email);
					if(mailGonderSonuc.equals("sent")) response.sendRedirect("onay.jsp");
					else %> <p><%= mailGonderSonuc %></p> <%
				}
				else
				{
					response.sendRedirect("register.jsp");
				}
			}
			else
			{
				out.println("Girdiğiniz Emaile ait bir hesap mevcut.");
				out.println("-->" +user.getId() + "<<<---");
			}
			
		}
		else
		{
			hatalar += " Şifre 6 karakterden uzun olmalı.";
		}
	}
	else
	{
		response.sendRedirect("register.jsp");
	}

%>

</body>
</html>