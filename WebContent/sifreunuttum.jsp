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
	    var email = document.forms["sifreunuttumform"]["email"].value;
	    
	    var hatalar = "";
	    var dogrulama = true;
	    
	    
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

	  		<form class="mt-5" action="sifreunuttumPost.jsp" method="post" style="margin-left:20%;margin-right:20%;" name = "sifreunuttumform" onsubmit="return dogrula()">
	  			<input class="form-control" placeholder="Email" name="email" value=""/>
	  			<button style="float:right;" class="btn btn-primary mt-3">Şifremi Yenile</button>
	  		</form>
		
		<%
   }
%>


</body>
</html>