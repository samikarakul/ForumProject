<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" >


<title>Register page.</title>
</head>
<body>

	<%@include file='navbar.jsp'%>
	
	<script>
	function dogrula() {
	    var ad = document.forms["registerform"]["ad"].value;
	    var soyad = document.forms["registerform"]["soyad"].value;
	    var username = document.forms["registerform"]["username"].value;
	    var password = document.forms["registerform"]["password"].value;
	    var email = document.forms["registerform"]["email"].value;
	    
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

	  		<form class="mt-5" action="registerPost.jsp" method="post" style="margin-left:20%;margin-right:20%;" name = "registerform" onsubmit="return dogrula()">
	  			<input class="form-control" placeholder="Adi" name="ad" value=""/>
	  			<input class="form-control" placeholder="Soyadi" name="soyad" value=""/>
	  			<input class="form-control" placeholder="Username" name="username" value=""/>
	  			<input type="password" class="form-control" placeholder="Parola" name="password" value=""/>
	  			<input class="form-control" placeholder="Email" name="email" value=""/>
	  			<button style="float:right;" class="btn btn-primary mt-3">Kayıt ol</button>
	  		</form>
		
		<%
   }
%>

</body>
</html>