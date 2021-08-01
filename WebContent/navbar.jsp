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
<body style="background-color: #E7DFDF !important;">
<%
String email=(String)session.getAttribute("s_email");

UserControl userControl = new UserControl();
User user = userControl.kullaniciBul_email(email);

%>
   <nav class="navbar navbar-expand bg-primary">
		<div class="collapse navbar-collapse">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="btn" aria-current="page" href="homepage.jsp" style="color:#fff;">Anasayfa</a>
	        </li>
	        <%
	        if(email!=null)
	        {
	        	%>
	        	
		       	<li class="nav-item">
		          <a class="btn" href="kategoriler.jsp" style="color:#fff;">Kategoriler</a>
		        </li>
		        <li class="nav-item">
		          <a class="btn" href="yeniGonderi.jsp" style="color:#fff;">Gönderi Paylaş</a>
		        </li>
		        <li class="nav-item">
		          <a class="btn" href="kullaniciAyarlari.jsp" style="color:#fff;">Bilgileri Düzenle</a>
		        </li>
		        <li class="nav-item">
		          <a class="btn" href="gonderilerim.jsp" style="color:#fff;">Gönderilerim</a>
		        </li>
	        	<%
	        	if(user.getYetki().equals("0"))
	        	{
	        		%>
	        		<li class="nav-item">
			          <a class="btn" href="kullanicilar.jsp" style="color:#fff;">Kullanıcılar</a>
			        </li>
	        		<%
	        	}
	        }
	        %>
	      </ul>
	      
	      <ul class="navbar-nav" style="margin-right:50px;" >
	      	<%
	      	if(email==null)
	        {
	        	
	        	%>
	        	<li class="nav-item">
		          <a class="btn" href="login.jsp" style="color:#fff;">Giriş Yap</a>
		        </li>
        		<%
        		
	        }
	        else
	        {
	        	%>
		        <li class="nav-item">
			          <a class="btn" href="logout.jsp" style="color:#fff;">Çıkış Yap</a>
			    </li>
			   <%
	        }%>
	        
	      </ul>
	    </div>
	</nav>

	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>