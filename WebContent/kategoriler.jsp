<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="java.util.*" %>
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
   CategoryControl categoryControl = new CategoryControl();
   List<Category> categories = categoryControl.kategori_listesi();
   
   if(user.getYetki().equals("0"))
   {
	   %>
	   
	   <div class="container mt-4">
	   		<a href="PdfOlusturCategory.jsp" class="btn btn-success">Kategorilerin PDFini Çıkar</a>
	   </div>
	   
	   <div class="container mt-4">
			<h1 class="text-center">Kategori Sayfası</h1>
		</div>

		<div class="container py-4">
			<form action="kategoriEkle_post.jsp" method="post">
				<p style="float:left;">Kategorinin Adı:</p>
				<textarea class="form-control mb-3" name="categoryBody"></textarea>
				<button class="btn btn-success" style="float:right;width:100%;">Kategori Ekle</button>
			</form>
		</div>
	   <%
   }
   
   for(Category category: categories)
   {
	   %>
	   <div class="mt-5 container">
	   		<div class="d-flex align-items-center" style="margin-left: 30%;">
		   		<div class="">
			   		<form action="kategoriDetay.jsp" method="post">
						<input type="hidden" value="<%= category.getId() %>" name="id"/>
						<button class="btn btn-primary" style="width: 200px;"><%= category.getCategory_body() %></button>
					</form>
		   		</div>
				
				<%
				if(user.getYetki().equals("0"))
				{
					%>
					<div class="mx-5">
						<div style="display: inline-block;">
					   		<form action="kategoriGuncelle.jsp" method="post">
								<input type="hidden" value="<%= category.getId() %>" name="id"/>
								<button class="btn btn-warning">Güncelle</button>
							</form>
				   		</div>
				   		<div style="display: inline-block;">
					   		<form action="kategoriSil.jsp" method="post">
								<input type="hidden" value="<%= category.getId() %>" name="id"/>
								<button class="btn btn-danger">X</button>
							</form>
				   		</div>
					</div>
					
					<%
				}
				%>
			</div>
		</div>
	   <%
	   
   }

%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>