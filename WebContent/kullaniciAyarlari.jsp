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

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" >

<title>Insert title here</title>
</head>
<body>

<%@include file='navbar.jsp'%>

	<script>
	function dogrula() {
	    var ad = document.forms["kullaniciayarform"]["kullanici_adi"].value;
	    var soyad = document.forms["kullaniciayarform"]["kullanici_soyAdi"].value;
	    var username = document.forms["kullaniciayarform"]["kullanici_kullaniciAdi"].value;
	    var password = document.forms["kullaniciayarform"]["kullanici_sifre"].value;
	    var email = document.forms["kullaniciayarform"]["kullanici_email"].value;
	    
	    var hatalar = "";
	    var dogrulama = true;
	    
	    if (ad == null || ad == ""){
	    	hatalar += " Ad Kısmını Boş geçtiniz!";
	        dogrulama = false;
	    }
	    
	    if (soyad == null || soyad == ""){
	    	hatalar += " Soyad Kısmını Boş geçtiniz!"
	        dogrulama =  false;
	    }
	    
	    if (username == null || username == ""){
	    	hatalar += " Kullanıcı Adı Kısmını Boş Geçtiniz!";
	        dogrulama =  false;
	    }
	    
	    if (password == null || password == ""){
	    	hatalar += " Şifre Kısmını Boş Geçtiniz!";
	        dogrulama =  false;
	    }
	    
	    if (email == null || email == ""){
	    	hatalar += " Email Kısmını Boş Geçtiniz!";
	        dogrulama =  false;
	    }
	    
	    if(dogrulama == false)
    	{
	    	alert(hatalar);
    		return false;
    	}
	    
	}
</script>

<form action="kullaniciBilgiGuncelle.jsp" method="post" class="pt-3" style="padding-left:20%; padding-right: 20%;" name = "kullaniciayarform" onsubmit="return dogrula()">
	<input type="hidden" name="kullanici_kullaniciAdi" value="<%= user.getKullaniciAdi() %>"/>
	<input name="kullanici_adi" value="<%= user.getAdi() %>" class="form-control"/>
	<input name="kullanici_soyAdi" value="<%= user.getSoyadi() %>" class="form-control"/>
	<input name="kullanici_sifre" value="<%= user.getKullaniciSifre() %>" class="form-control"/>
	<input name="kullanici_email" value="<%= user.getEmail() %>" class="form-control"/>
	
	<button class="btn btn-secondary mt-3">Güncelle</button>
</form>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>