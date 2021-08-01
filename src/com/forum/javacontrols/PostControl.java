package com.forum.javacontrols;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.forum.classes.Post;

import java.sql.ResultSetMetaData;

public class PostControl {

	public String postCagir(String id)
	{
		try {
			String postBody = "";
			
			Statement statement = null;
			ResultSet resultSet = null;

			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 
			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				
				String sql = "Select * from post where id = " + id;
				resultSet = statement.executeQuery(sql);

				while(resultSet.next()){
					postBody = resultSet.getString("post_body");
				
				}
				connection.close();
				
			}
			return postBody;
		}
		catch(Exception ex)
		{
			return "Hatalý!";
		}
	}
	public List<Post> tumGonderileriDondur()
	{
		List<Post> posts = new ArrayList<Post>();
		UserControl userControl = new UserControl();
		
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
				String sql = "Select * from post";
				resultSet = statement.executeQuery(sql);

				while(resultSet.next()){
					Post post = new Post();
					post.setId(resultSet.getString("id"));
					post.setUser_id(resultSet.getString("user_id"));
					post.setCategory_id(resultSet.getString("category_id"));
					post.setPost_body(resultSet.getString("post_body"));
					post.setUser_kullaniciAdi(userControl.kullaniciBul_kullaniciId(resultSet.getString("user_id")).getKullaniciAdi());
					
					posts.add(post);
				
				}
				connection.close();
				
			}
			
		}
		catch(Exception ex)
		{
			
		}
		
		return posts;
	}
	
	public List<Post> FiltreliGonderileriDondur(String arama_cumlesi)
	{
		List<Post> posts = new ArrayList<Post>();
		UserControl userControl = new UserControl();
		String arama = '%' + arama_cumlesi + '%';
		try {
			
			Statement statement = null;
			PreparedStatement ps = null;
			ResultSet resultSet = null;

			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 
			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				String qry = "SELECT * FROM post WHERE post_body like ?";
				ps = connection.prepareStatement(qry);
				ps.setString(1, "%" + arama_cumlesi + "%");
				resultSet = ps.executeQuery();
				while(resultSet.next()){
					Post post = new Post();
					post.setId(resultSet.getString("id"));
					post.setUser_id(resultSet.getString("user_id"));
					post.setCategory_id(resultSet.getString("category_id"));
					post.setPost_body(resultSet.getString("post_body"));
					post.setUser_kullaniciAdi(userControl.kullaniciBul_kullaniciId(resultSet.getString("user_id")).getKullaniciAdi());
					
					posts.add(post);
				
				}
				connection.close();
				
			}
			
		}
		catch(Exception ex)
		{
			
		}
		
		return posts;
	}
	

	public Post postCagirClass(String id)
	{
		Post post = new Post();
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
				String sql = "Select * from post where id = " + id;
				resultSet = statement.executeQuery(sql);

				while(resultSet.next()){
					post.setId(resultSet.getString("id"));
					post.setUser_id(resultSet.getString("user_id"));
					post.setCategory_id(resultSet.getString("category_id"));
					post.setPost_body(resultSet.getString("post_body"));
				
				}
				connection.close();
				
			}
			
		}
		catch(Exception ex)
		{
			
		}
		return post;
	}
	
	public Post postBul(String id)
	{
		Post post = new Post();
		try {
			String postBody = "";
			
			Statement statement = null;
			ResultSet resultSet = null;

			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 
			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				String sql = "Select * from post where id = " + id;
				resultSet = statement.executeQuery(sql);
				
				while(resultSet.next()){
					post.setId("id");
					post.setUser_id(resultSet.getString("user_id"));
					post.setCategory_id(resultSet.getString("category_id"));
					post.setPost_body(resultSet.getString("post_body"));
					
				}
				connection.close();
				
			}
		}
		catch(Exception ex)
		{
			
		}
		return post;
	}
	
	public void postEkle(String userId, String categoryId, String postBody)
	{
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
				int i=statement.executeUpdate("insert into post(user_id,category_id,post_body) values('"+userId+"','"+categoryId+"','"+postBody+"')");
				connection.close();
			}
			
		}
		catch(Exception ex)
		{
			
		}
	}
	
	public int postDuzenle(String postId, String userId, String categoryId, String postBody)
	{
		int i = 0;
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
				String sql="Update post set user_id=?,category_id=?,post_body=? where id='" + postId + "'";
				ps = connection.prepareStatement(sql);
				ps.setString(1,userId);
				ps.setString(2, categoryId);
				ps.setString(3, postBody);

				i = ps.executeUpdate();
				
			}
			
		}
		catch(Exception e)
		{
			i = -10;
			
		}
		return i;
	}
	
	public int postSil(String id)
	{
		int i = 0;
		int iComment = 0;
		try
		{
			Statement statement = null;
			PreparedStatement ps = null;
			PreparedStatement psComment = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				String sql="Delete from post where id=?";
				ps = connection.prepareStatement(sql);
				ps.setString(1,id);
				i = ps.executeUpdate();
				
				String sqlComment = "Delete from comment where post_id = ?";
				psComment = connection.prepareStatement(sqlComment);
				psComment.setString(1, id);
				iComment = psComment.executeUpdate();

			}
			
		}
		catch(Exception e)
		{
			i = -10;
			iComment = -10;
			
		}
		
		return i + iComment;
		
	}
	
	public List<Post> gonderilerimDondur(String userId)
	{
		List<Post> posts = new ArrayList<Post>();
		
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
				String sql = "Select * from post where user_id = "+userId;
				resultSet = statement.executeQuery(sql);

				while(resultSet.next()){
					Post post = new Post();
					post.setId(resultSet.getString("id"));
					post.setUser_id(resultSet.getString("user_id"));
					post.setCategory_id(resultSet.getString("category_id"));
					post.setPost_body(resultSet.getString("post_body"));
					
					posts.add(post);
				}					
				connection.close();					
			}
			
		}
		catch(Exception ex)
		{
			
		}
		
		return posts;
	}
	
}
