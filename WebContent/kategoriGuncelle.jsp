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
	    var categoryBody = document.forms["kategoriguncelleform"]["categoryBody"].value;

	    var hatalar = "";
	    var dogrulama = true;
	    
	    if (categoryBody == null || categoryBody == ""){
	    	hatalar += " Kategori Adı Kısmını Boş geçtiniz!";
	        dogrulama = false;
	    }

	    if(dogrulama == false)
    	{
	    	alert(hatalar);
    		return false;
    	}
	    
	}
</script>

<%
	if(!user.getYetki().equals("0")) response.sendRedirect("homepage.jsp");

	String categoryId = request.getParameter("id");

	
	CategoryControl categoryControl = new CategoryControl();
	Category category = categoryControl.getCategoryById(categoryId);
	if(category != null)
	{
		%>
		<div class="mt-5 container">
			<form action="kategoriGuncelle_post.jsp" method="post" name = "kategoriguncelleform" onsubmit="return dogrula()">
				<input type="hidden" name="categoryId" value="<%=category.getId() %>" />
				<textarea class="form-control" name="categoryBody"><%= category.getCategory_body() %></textarea>
				<button class="btn btn-primary mt-4" style="float: right;">Güncelle</button>
			</form>
		</div>
		<%
	}
	else
	{
		response.sendRedirect("kategoriler.jsp");
	}
%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>