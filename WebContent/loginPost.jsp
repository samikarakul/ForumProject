<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum.javacontrols.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Cookie adding login page.</title>
</head>
<body>

<%

	String email = request.getParameter("email");
	String password = request.getParameter("password");

	UserControl userControl = new UserControl();
	boolean sonucDeger = userControl.dbControl(email, password);
	
	if(sonucDeger)
	{
		if(email != null && password != null)
		{
			session.setAttribute("s_email", email);
			response.sendRedirect("homepage.jsp");
		}
	}
	else{
		%>
		<form action="login.jsp" method="post" id="frmPostDetay">
			<input type="hidden" name="hatalar" value="Kullanıcı Adı veya Şifre Hatalı!"/>
		</form>
		<script>
			document.getElementById("frmPostDetay").submit() 
		</script>
		<%
	}

%>

</body>
</html>