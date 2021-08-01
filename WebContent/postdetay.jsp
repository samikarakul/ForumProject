<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.forum.javacontrols.*" %>

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
	String postId = request.getParameter("id");

	if(!postId.equals(""))
	{
		PostControl postControl = new PostControl();
		Post post = postControl.postCagirClass(postId);
		if(post != null)
		{
			%>
			<div class="gonderiBaslik container mx-auto my-5 text-center">
				<h1 class="py-5 text-light"><%= post.getPost_body() %></h1>
			</div>
			<%
			try {
				
				Statement statement = null;
				ResultSet resultSet = null;

				String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 
				Connection connection = null; 
				
				Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
				
				connection = DriverManager.getConnection(connectionURL, "root", "neuromancer");
				if(!connection.isClosed())
				{
					statement=connection.createStatement();
					String sql = "Select comment.id,comment.post_id,comment.comment_body,comment.user_id,user.id,user.kullaniciAdi from comment inner join user on comment.user_id = user.id where post_id = " + postId;
					resultSet = statement.executeQuery(sql);

					while(resultSet.next()){
						%>
						<div class="yorumDiv container row mt-5 mx-auto mb-5 border border-dark">
							<div class="yorumKullaniciAdi container col-3 border-end">
								<div class="mt-3">
									<h3 class=" text-center"><%= resultSet.getString("kullaniciAdi") %></h3>
									<%
									if(post.getUser_id().equals(resultSet.getString("user_id")))
									{
										out.println("<h1 class='bg-danger'>Başlık Sahibi</h1>");
									}
									%>
								</div>
							</div>	
							<div class="container col-9">
								<div class="mt-3">
									<h3 class="px-4" style="display: inline-block;"><%= resultSet.getString("comment_body") %></h3>
									<%
									if(resultSet.getString("kullaniciAdi").equals(user.getKullaniciAdi()) || user.getYetki().equals("0"))
									{
										%>
										<div class="kontrolDiv" style="display: inline-block; float:right;">
											
											<div class="yorumGuncelleDil" style="display: inline-block; margin-right: 10px;">
												<form action="yorumDuzenle.jsp" method="post">
													<input type="hidden" name="commentId" value="<%= resultSet.getString("id") %>"/>
													<input type="hidden" name="postId" value="<%= resultSet.getString("post_id") %>"/>
													<input type="hidden" name="commentBody" value="<%= resultSet.getString("comment_body")%>"/>
													<button class="btn btn-warning">Düzenle</button>
												</form>
											</div>
											
											<div class="silmeDiv" style="display: inline-block;">
												<form action="yorumSil.jsp" method="post">
													<input type="hidden" name="commentId" value="<%= resultSet.getString("id") %>"/>
													<input type="hidden" name="postId" value="<%= resultSet.getString("post_id") %>"/>
													<button class="btn btn-danger">X</button>
												</form>
											</div>
										</div>
										
										<%
									}%>
								</div>
							</div>
							
						</div>
						<%
					}
					connection.close();
				}
			}
			catch(Exception ex)
			{
				out.println("Ex: "+ ex);
			}
		}
		else
		{
			out.println("<h1>Bir hata çıktı.</h1>");
		}
	}
	else
	{
		out.println("<h1>Aradığınız post bulunamadı.</h1>");
	}
%>

<script>
	function dogrula() {
	    var comment_body = document.forms["yeniyorumform"]["comment_body"].value;
	    
	    var hatalar = "";
	    var dogrulama = true;
	    
	    
	    if (comment_body == null || comment_body == ""){
	    	hatalar += " Yorum Kısmını Boş Geçtiniz!";
	        dogrulama =  false;
	    }
	    
	    if(dogrulama == false){
	    	
	    	alert(hatalar);
	    	return false;
	    }
	    
	}
</script>

<%
	if(email!=null)
	{
		%>
		<div class="container">
			<form action="yeniYorum.jsp" method="post" class="pt-3" name = "yeniyorumform" onsubmit="return dogrula()">
				<input type="hidden" name="postId" value="<%= postId %>"/>
				<input type="hidden" name="userId" value="<%= user.getId() %>"/>
				<textarea name="comment_body" style="width:100%; height:100px;"></textarea>
				<button class="btn btn-primary mb-4" style="float:right;">Gönder</button>
			</form>
		</div>
		<%
	}
%>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>