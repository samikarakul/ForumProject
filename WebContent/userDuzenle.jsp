<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.forum.classes.*" %>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" >

<title>Kategori Güncelle</title>
</head>
<body>

<%@include file='navbar.jsp'%>

<script>
	function dogrula() {
	    var userAdi = document.forms["userduzenleform"]["userAdi"].value;
	    var userSoyadi = document.forms["userduzenleform"]["userSoyadi"].value;
	    var userKullaniciAdi = document.forms["userduzenleform"]["userKullaniciAdi"].value;
	    var userKullaniciEmail = document.forms["userduzenleform"]["userKullaniciEmail"].value;
	    
	    var hatalar = "";
	    var dogrulama = true;
	    
	    if (userAdi == null || userAdi == ""){
	    	hatalar += " Ad Kısmını Boş geçtiniz!";
	        dogrulama = false;
	    }
	    
	    if (userSoyadi == null || userSoyadi == ""){
	    	hatalar += " Soyad Kısmını Boş geçtiniz!"
	        dogrulama =  false;
	    }
	    
	    if (userKullaniciAdi == null || userKullaniciAdi == ""){
	    	hatalar += " Kullanıcı Adı Kısmını Boş Geçtiniz!";
	        dogrulama =  false;
	    }
		    
	    if (userKullaniciEmail == null || userKullaniciEmail == ""){
	    	hatalar += " Email Kısmını Boş Geçtiniz!";
	        dogrulama =  false;
	    }
	    
	    if(dogrulama == false){
	    	
	    	alert(hatalar);
	    	return false;
	    }
	    
	}
</script>

<%
	if(!user.getYetki().equals("0")) response.sendRedirect("homepage.jsp");

	String userId = request.getParameter("userId");
	User usr = userControl.kullaniciBul_kullaniciId(userId);
	if(usr != null)
	{
		%>
		
		<div class="mt-5 container">
			<h1 class="text-center"><%= usr.getKullaniciAdi() %> Kullanıcısının Bilgileri </h1>
			<form action="userDuzenle_post.jsp" method="post" name = "userduzenleform" onsubmit="return dogrula()">
				<input type="hidden" name="userId" value="<%= usr.getId() %>"/>
				<textarea class="mt-2 form-control" name="userAdi"><%=usr.getAdi() %></textarea>
				<textarea class="mt-2 form-control" name="userSoyadi"><%= usr.getSoyadi() %></textarea>
				<textarea class="mt-2 form-control" name="userKullaniciAdi"><%= usr.getKullaniciAdi() %></textarea>
				<textarea class="mt-2 form-control" name="userKullaniciEmail"><%= usr.getEmail() %></textarea>
				<button class="mt-2 btn btn-primary">Güncelle</button>
			</form>
		</div>
		
		<%
	}	
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>