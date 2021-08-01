<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="com.forum.classes.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%@include file='navbar.jsp'%>
<%
	String hashkey = request.getParameter("hashkey");
	if(hashkey != null)
	{
		if(!hashkey.equals(""))
		{
			User usr = userControl.KullaniciSifreUnuttumHashSorgu(hashkey);
			if(usr.getId()!=null)
			{
				response.sendRedirect("sifreyenile.jsp");
			}
			else
			{
				out.println("user bulunamadı");
			}
		}
		else
		{
			out.println("hashkey = '' hatası");
		}
		
	}
	else
	{
		out.println("hashkey boş");
	}
	
%>



</body>
</html>