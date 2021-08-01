<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%@include file='navbar.jsp'%>
	<script>
	function dogrula() {
	    var onayMail = document.forms["onayform"]["onayMail"].value;
	    var onayKodu = document.forms["onayform"]["onayKodu"].value;
	    
	    var hatalar = "";
	    var dogrulama = true;
	    
	    if (onayMail == null || onayMail == ""){
	    	hatalar += " Onay Maili Kısmını Boş geçtiniz!";
	        dogrulama = false;
	    }
	    
	    if (onayKodu == null || onayKodu == ""){
	    	hatalar += " Onay Kodu Kısmını Boş geçtiniz!"
	        dogrulama =  false;
	    }
	    
	    if(dogrulama == false){
	    	
	    	alert(hatalar);
	    	return false;
	    }  
	}
</script>

	<div class="mt-3 container">
		<form action="onayPost.jsp" method="post" name = "onayform" onsubmit="return dogrula()">
			<p>Mail Adresiniz:</p>
			<input class="form-control" type="text" name="onayMail" placeholder="Onay Kodu Gönderilen Mail Adresinizi girin"/>
			<p>Onay Kodunuz:</p>
			<input class="form-control" type="text" name="onayKodu" placeholder="Onay kodunuzu girin."/>
			<button class="btn btn-primary">Onayla</button>
		</form>
	</div>
</body>
</html>