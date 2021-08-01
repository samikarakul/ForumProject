<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" >

<title>Cookie adding login page.</title>
</head>
<body>

  	<%@include file='navbar.jsp'%>
  	
	<script>
	function dogrula() {
	    var password = document.forms["loginform"]["password"].value;
	    var email = document.forms["loginform"]["email"].value;
	    
	    var hatalar = "";
	    var dogrulama = true;
	    
	    if (password == null || password == ""){
	    	hatalar += " Şifre Kısmını Boş Geçtiniz!";
	        dogrulama =  false;
	    }
	    
	    if (email == null || email == ""){
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
   
   if(email==null)
   {
 	  %>
	  		<form class="mt-5" action="loginPost.jsp" method="post" style="margin-left:20%;margin-right:20%;" name = "loginform" onsubmit="return dogrula()">
	  			<input class="form-control" placeholder="Email" name="email" value=""/>
	  			<input type="password" class="form-control" placeholder="Parola" name="password" value=""/>
	  			<a href="register.jsp" class="btn btn-secondary mt-3">Kayıt ol</a>
	  			<a href="sifreunuttum.jsp" class="btn btn-transparent mt-3">Şifrenizi mi unuttunuz?</a>
	  			<button style="float:right;" class="btn btn-primary mt-3">Giriş Yap</button>
	  		</form>
	  		
		<%
		String gelenHatalar = request.getParameter("hatalar");
		if(gelenHatalar != null)
		{
			%>
			<div class="container mt-3" style="margin-left:20%;margin-right:20%;">
				<p class="text-danger"><%= gelenHatalar %></p>
			</div>
			
			<%
		}
   }
%>

</body>
</html>