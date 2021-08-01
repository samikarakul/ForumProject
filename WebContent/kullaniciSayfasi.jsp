<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="com.forum.javacontrols.*" %>
<%@ page import="com.forum.classes.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%@include file='navbar.jsp'%>
<%
	String kullaniciId = request.getParameter("kullaniciId");
	User usr = userControl.kullaniciBul_kullaniciId(kullaniciId);
	if(usr !=null)
	{
		PostControl postControl = new PostControl();
		List<Post> posts = postControl.gonderilerimDondur(kullaniciId);
		if(posts.size() != 0)
		{ 
			%> 
			<h1 class="mt-5 text-center"><%= usr.getKullaniciAdi() %></h1>
			<h1 class="mt-5 text-center">Gönderi sayısı: <%= posts.size() %></h1> <%
			for(Post post : posts)
			{
				%>
				<div class="outsider-div container mt-5 mb-5" style="border-style:solid; margin-bottom:10px;">
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
	}
	
%>

</body>
</html>