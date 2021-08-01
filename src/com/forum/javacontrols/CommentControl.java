package com.forum.javacontrols;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CommentControl {

	public int yeniYorumEkle(String postId, String userId, String commentBody)
	{
		int i = 0;
		try {

			Statement statement = null;
			ResultSet resultSet = null;

			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 
			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				i=statement.executeUpdate("insert into comment(user_id,post_id,comment_body) values('"+userId+"','"+postId+"','"+commentBody+"')");
				connection.close();
			}
			
		}
		catch(Exception ex)
		{
			
		}
		return i;
	}
	public int yorumSil(String commentId)
	{
		int i = 0;
		int iComment = 0;
		try
		{
			Statement statement = null;
			PreparedStatement psComment = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				String sqlComment = "Delete from comment where id = ?";
				psComment = connection.prepareStatement(sqlComment);
				psComment.setString(1, commentId);
				iComment = psComment.executeUpdate();
			}
			
		}
		catch(Exception e)
		{
			iComment = -10;
			
		}
		return iComment;
	}
	
	public String commentUpdate(String commentId, String commentBody)
	{
		int i = 0;
		String hata = "yok";
		try
		{
			Statement statement = null;
			PreparedStatement ps = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				String sql="Update comment set comment_body=? where id='" + commentId + "'";
				ps = connection.prepareStatement(sql);
				ps.setString(1,commentBody);

				i = ps.executeUpdate();
			}
		}
		catch(Exception e)
		{
			i = -10;
			hata = " -> " + e.getMessage();
		}
		return hata;
	}
	
}
