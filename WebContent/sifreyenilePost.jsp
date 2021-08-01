<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="com.forum.classes.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Cookie adding login page.</title>
</head>
<body>

<%

	String email = request.getParameter("email");
	String password = request.getParameter("password");

	UserControl userControl = new UserControl();
	if(email!=null && password!=null)
	{
		User user  = userControl.kullaniciBul_email(email);
		user.setKullaniciSifre(password);
		String sonuc = userControl.kullaniciSifreYenile(user);
		if(sonuc.equals("k"))
		{
			response.sendRedirect("login.jsp");
		}
		out.println("bir hata oluştu.");
	}
	else
	{
		out.println("bir hata oluştu.");
	}
%>

</body>
</html>