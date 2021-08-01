<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%@include file='navbar.jsp'%>
<%
	String onayEmail = request.getParameter("onayMail");
	String onayKodu = request.getParameter("onayKodu");
	
	
	boolean kodKontrol = userControl.onayKoduKontrolEt(onayEmail, onayKodu);
	
	if(kodKontrol)
	{
		if(userControl.kullaniciOnayla(onayEmail))
		{
			%>
			<p class="bg-success">Kodunuz Onaylandı!! Giriş yapabilirsiniz!!</p>
			<a class="btn btn-success" href="login.jsp" role="button">Giriş Yap</a>
			<%
		}
		else
		{
			%>
			<p class="bg-danger">Bir sorun oluştu. lütfen tekrar deneyin.<p>
			<a class="btn btn-info" href="onay.jsp" role="button">Onay Sayfası</a>
			<%
		}
		
	}
	else
	{
		%>
		<p class="bg-danger">Kodunuz Yanlış. Tekrar deneyin.<p>
		<a class="btn btn-info" href="onay.jsp" role="button">Kodu Gir</a>
		<%
	}
%>



</body>
</html>