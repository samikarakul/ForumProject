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

<%
	String postId = request.getParameter("id");
	String categoryId = request.getParameter("categoryId");
	String userId = request.getParameter("userId");
	String postBody = request.getParameter("postBody");
	
	PostControl postControl = new PostControl();
	Post post = postControl.postBul(postId);
	if(post != null)
	{
		categoryId = post.getCategory_id();
		userId = post.getUser_id();
		postBody = post.getPost_body();
		
	}
%>

<%
	CategoryControl categoryControl = new CategoryControl();
	List<Category> categories = categoryControl.kategori_listesi();
%>

<script>
	function dogrula() {
	    var postBody = document.forms["postguncelleform"]["postBody"].value;
	    
	    var hatalar = "";
	    var dogrulama = true;
	    
	    if (postBody == null || postBody == ""){
	    	hatalar += " Gönderi Kısmını Boş geçtiniz!";
	        dogrulama = false;
	    }
	    
	    if(dogrulama == false){
	    	
	    	alert(hatalar);
	    	return false;
	    }
	    
	}
</script>


<div class="container">
	<form action="postGuncelle.jsp" method="post" name = "postguncelleform" onsubmit="return dogrula()">
		<input type="hidden" name="id" value="<%= postId %>"/>
		<input type="hidden" name="userId" value="<%= userId %>"/>
		
	
		<select class="form-select my-3" name="categories" id="categories">
		<%
		for(Category category: categories)
		{
			if(category.getId().equals(categoryId))
			{
				%> <option value="<%= category.getId() %>" selected><%=category.getCategory_body() %></option> <%
			}
			else
			{
				%> <option value="<%= category.getId() %>"><%=category.getCategory_body() %></option> <%
			}
		}
		%>
		</select>
		
		<textarea class="form-control my-3" name="postBody"><%= postBody %></textarea>
	
		<button class="btn btn-secondary my-3" style="float: right;">Güncelle</button>
	</form>
</div>

	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>