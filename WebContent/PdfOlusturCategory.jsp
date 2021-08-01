<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ page import="com.forum.javacontrols.*" %>
<%@ page import="com.forum.classes.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<title>Insert title here</title>
</head>
<body>
<%
	CategoryControl categoryControl = new CategoryControl();
	List<Category> Categories = categoryControl.kategori_listesi();
	CategoriesPdf categoriesPdf = new CategoriesPdf();
	if(categoriesPdf.calistir(Categories).equals("sorun yok"))
	{
		response.sendRedirect("kategoriler.jsp");
	}
%>
</body>
</html>