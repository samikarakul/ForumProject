<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" >

<title>Homepage</title>
</head>
<body>

   <%@include file='navbar.jsp'%>
   
   <%
   if(user.getYetki().equals("0"))
   {
	   %>
	   <div class="mt-2 container">
		   <div style="display:inline-block;">
		   	<a href="PdfOlustur.jsp" class="btn btn-success" style="display: inline-block;">PDF Çıkart</a>
		   </div>
	   </div>
	   <%
   }
   %>
   	<div style="margin-left: 70%; ">
	   	<form action="homepage.jsp" method="get" style="display: inline-block;">
	   		<input name="s" type="text" class="form-control" style="display: inline-block;"/>
	   		<button class="btn btn-secondary" style="display:inline-block; float:right;">Ara</button>
	   	</form>
   	</div>
   <%
   	String s = request.getParameter("s");
  	PostControl postControl = new PostControl();
  	List<Post> posts = new ArrayList<Post>();
   	if(s!=null)
   	{
   		posts = postControl.FiltreliGonderileriDondur(s);
   		if(posts.size()!=0)
   		{
   			for(Post post: posts)
   			{
   				%>
   	   			<div class="outsider-div container mt-5" style="border-style:solid; margin-bottom:10px;">
   					<div class="inside-div" style="padding-left:50px; padding-bottom: 30px;">
   						<p class="pt-3"><%=post.getPost_body()%></p>
   						
   						<div class="container">
   							<div style="display: inline-block;">
   								<form action="postdetay.jsp" method="post">
   									<input type="hidden" value="<%= post.getId() %>" name="id"/>
   									<button class="btn btn-primary">İncele</button>
   								</form>
   							</div>
   							
   							<%
   							if(user.getYetki().equals("0") || user.getKullaniciAdi().equals(post.getUser_kullaniciAdi()))
   							{
   								%>
   								<div style="display: inline-block;">
   									<form action="postDuzenle.jsp" method="post">
   										<input type="hidden" value="<%= post.getId() %>" name="id"/>
   										<button class="btn btn-warning">Düzenle</button>
   									</form>
   								</div>
   								
   								<div style="display: inline-block;">
   									<form action="postSil.jsp" method="post">
   										<input type="hidden" value="<%= post.getId() %>" name="id"/>
   										<button class="btn btn-danger">Sil</button>
   									</form>
   								</div>
   								
   								<%
   							}
   							%>
   						</div>
   						
   						<div style="float:right;">
   							<form action="kullaniciSayfasi.jsp" method="post">
   								<input type="hidden" name="kullaniciId" value="<%= post.getUser_id() %>"/>
   								<button class="btn bg-transparent text-muted"><%= post.getUser_kullaniciAdi() %></button>
   							</form>
   						</div>
   					</div>
   				</div>
   	   			<%
   			}
   		}
   	}
   	else
   	{
   		
   		posts = postControl.tumGonderileriDondur();
   		if(posts.size() != 0)
   		{
   			
   			for(Post post: posts)
   			{
   				%>
   	   			<div class="outsider-div container mt-5" style="border-style:solid; margin-bottom:10px;">
   					<div class="inside-div" style="padding-left:50px; padding-bottom: 30px;">
   						<p class="pt-3"><%=post.getPost_body() %></p>
   						
   						<div class="container">
   							<div style="display: inline-block;">
   								<form action="postdetay.jsp" method="post">
   									<input type="hidden" value="<%= post.getId() %>" name="id"/>
   									<button class="btn btn-primary">İncele</button>
   								</form>
   							</div>
   							
   							<%
   							if(user.getYetki().equals("0") || user.getKullaniciAdi().equals(post.getUser_kullaniciAdi()))
   							{
   								%>
   								<div style="display: inline-block;">
   									<form action="postDuzenle.jsp" method="post">
   										<input type="hidden" value="<%= post.getId() %>" name="id"/>
   										<button class="btn btn-warning">Düzenle</button>
   									</form>
   								</div>
   								
   								<div style="display: inline-block;">
   									<form action="postSil.jsp" method="post">
   										<input type="hidden" value="<%= post.getId() %>" name="id"/>
   										<button class="btn btn-danger">Sil</button>
   									</form>
   								</div>
   								
   								<%
   							}
   							%>
   						</div>
   						
   						<div style="float:right;">
   							<form action="kullaniciSayfasi.jsp" method="post">
   								<input type="hidden" name="kullaniciId" value="<%= post.getUser_id() %>"/>
   								<button class="btn bg-transparent text-muted"><%= post.getUser_kullaniciAdi() %></button>
   							</form>
   						</div>
   					</div>
   				</div>
   	   			<%
   			}
   			
   		}
   	}
   %>
   

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>