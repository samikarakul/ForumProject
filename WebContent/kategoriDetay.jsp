<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="com.forum.classes.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link href="./css/homepage.css" rel="stylesheet" type="text/css">
<title>Post Detay</title>
</head>
<body>

	<%@include file='navbar.jsp'%>
   
<%
	String categoryId = request.getParameter("id");
	CategoryControl categoryControl = new CategoryControl();
	
	List<Post> posts = categoryControl.kategoriDetayBul(categoryId);

	if(!posts.isEmpty())
	{
		for(Post post: posts)
		{
			%>
			<div class="outsider-div container mt-5" style="border-style:solid; margin-bottom:10px;">
				<div class="inside-div" style="padding-left:50px; padding-bottom: 30px;">
					<p class="pt-3"><%= post.getPost_body() %></p>
					
					<div class="container">
						<div style="display: inline-block;">
							<form action="postdetay.jsp" method="post">
								<input type="hidden" value="<%= post.getId() %>" name="id"/>
								<button class="btn btn-primary">İncele</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%
		}
	}
	else
	{
		out.println("<h1> Bu kategoriye ait post yok. </h1>");
	}	
%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>