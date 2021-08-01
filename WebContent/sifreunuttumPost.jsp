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

<%@include file='navbar.jsp'%>
<%
	String emailz=request.getParameter("email");
	
	if(emailz != null)
	{
		if(!emailz.equals(""))
		{
			User userz = userControl.kullaniciBul_email(emailz);
			if( userz.getId() != null)
			{
				MD5 md5 = new MD5();
				String md5_hashed = md5.getMd5(userz.getId());
				String sonuc = userControl.KullaniciSifreYenilemeMailiGonder(emailz, md5_hashed);
				if(sonuc.equals("k")) 
				{
					%><h1>Mailinize Gönderilen Bağlantıya tıklayın.</h1><%
				}
				out.println(sonuc);
			}
		}
		else{
			out.println("Boş Email.");
		}
	}


%>

</body>
</html>