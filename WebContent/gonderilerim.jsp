<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.forum.classes.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link href="./css/gonderilerim.css" rel="stylesheet" type="text/css">
<title>Gönderilerim</title>
</head>
<body>


   <%@include file='navbar.jsp'%>
   <div class="container my-5">
   		<h1 class="text-center">Gönderilerim</h1>
   </div>
   
   <jsp:useBean id="postBeanControl" class="com.forum.javacontrols.PostControl"/>  
   <%
   
    List<Post> posts = postBeanControl.gonderilerimDondur(user.getId());
    
    for(Post post: posts)
    {
    	%>
    	
    	<div class="gonderilerimFormlar container my-3 py-4 px-5 border border-dark">
    		<form action="postdetay.jsp" method="post">
	    		<input name="id" value="<%= post.getId() %>" type="hidden"/>
	    		<h3 class="pb-3"><%= post.getPost_body() %></h3>
	    		<button class="btn btn-primary formBtn">İncele</button>
	    	</form>
	    	
	    	<form action="postDuzenle.jsp" method="post">
	    		<input name="id" value="<%= post.getId() %>" type="hidden"/>
	    		<input name="userId" value="<%= user.getId() %>" type="hidden"/>
	    		<input name="categoryId" value="<%= post.getCategory_id() %>" type="hidden"/>
	    		<input name="postBody" value="<%= post.getPost_body() %>" type="hidden"/>
	    		<button class="btn btn-warning formBtn">Düzenle</button>
	    	</form>
	    	
	    	<form action="postSil.jsp" method="post">
	    		<input name="id" value="<%= post.getId() %>" type="hidden"/>
	    		<button class="btn btn-danger formBtn">Sil</button>
	    	</form> 		
    	</div>
    	
    	<%
     }
   %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>