<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" >

<title>Kullanıcı listesi</title>
</head>
<body>
<%@include file='navbar.jsp'%>

<%
if(user.getYetki().equals("0"))
{
	%>
	<div class="mt-2 container">
		<a href="PdfOlusturUser.jsp" class="mt-3 btn btn-success">PDF Çıkart</a>
	</div>
	<%
}
%>

<div class="mt-5 mb-5 container" style="margin-left: 30%;">
<%
	List<User> users = userControl.KullanicilariGetir();
	if(users != null)
	{
		for(User usr: users)
		{
			if(!usr.getYetki().equals("0"))
			{
				%>

					<div class="mt-5 container">
						<div class="" style="display: inline-block;">
							<form action="userDuzenle.jsp" method="post">
								<input type="hidden" name="userId" value="<%= usr.getId() %>"/>
								<button class="btn btn-primary" style="width:200px;"><%= usr.getKullaniciAdi() %></button>
							</form>
						</div>
						
						<div class="mx-4" style="display: inline-block;">
							<form action="userSil.jsp" method="post">
								<input type="hidden" name="userId" value="<%= usr.getId() %>"/>
								<button class="btn btn-danger">X</button>
							</form>
						</div>
					</div>
				<%
			}
			
		}
	}
%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>