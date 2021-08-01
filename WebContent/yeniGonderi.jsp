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

<title>Insert title here</title>
</head>
<body>
 	<%@include file='navbar.jsp'%>

<script>
	function dogrula() {
	    var postBody = document.forms["yenigonderiform"]["postBody"].value;
	    
	    var hatalar = "";
	    var dogrulama = true;
  
	    if (postBody == null || postBody == ""){
	    	hatalar += " Gönderi Kısmını Boş Geçtiniz!";
	        dogrulama =  false;
	    }
	    
	    if(dogrulama == false){
	    	
	    	alert(hatalar);
	    	return false;
	    }
	    
	}
</script>

	<br>
	<%
		if(user.getId().equals(""))
		{
			out.println("<h1>Hata var</h1>");
		}
		else
		{
			CategoryControl categoryControl = new CategoryControl();
			List<Category> categories = categoryControl.kategori_listesi();
			
			%>
			<div class="container mt-4">
				<form action="yeniGonderiPost.jsp" method="post" name = "yenigonderiform" onsubmit="return dogrula()">
					<input type="hidden" name="userId" value="<%= user.getId() %>"/>
					<select class="form-select mb-3" name="kategoriId">
					<%
						for(Category category: categories)
						{
							%> <option value="<%= category.getId() %>"><%= category.getCategory_body() %></option> <%
						}
					%>
					</select>
					<textarea class="form-control mb-3" name="postBody"></textarea>
					<button class="btn btn-primary" style="float:right;">Paylaş</button>
				</form>
			</div>
				
			<%
		}
	
	%>

	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>