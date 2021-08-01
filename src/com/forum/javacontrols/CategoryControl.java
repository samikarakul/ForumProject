package com.forum.javacontrols;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.forum.classes.Category;
import com.forum.classes.Post;

public class CategoryControl {
	
	public List<Category> kategori_listesi()
	{
		List<Category> categories = new ArrayList<Category>();  
		
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
				String sql = "Select * from category";
				resultSet = statement.executeQuery(sql);

				while(resultSet.next()){
					Category category = new Category(resultSet.getString("id"), resultSet.getString("category_body"));
					categories.add(category);
				}					
				connection.close();					
			}
			
		}
		catch(Exception ex)
		{
			
		}
		
		return categories;
	}
	
	public String kategoriEkle(String categoryBody)
	{
		String hata = "k";
		int i=0;
		try {

			Statement statement = null;

			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 
			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				i=statement.executeUpdate("insert into category(category_body) values('"+categoryBody+"')");
				connection.close();
			}
			
		}
		catch(Exception ex)
		{
			if(i<=0) hata = hata + " " + ex.getMessage();
		}
		return hata;
	}
	
	public String kategoriUpdate(Category category)
	{
		String hata = "k";
		int i = 0;
		try
		{
			PreparedStatement ps = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				String sql="Update category set category_body=? where id='" + category.getId() + "'";
				ps = connection.prepareStatement(sql);
				ps.setString(1,category.getCategory_body());

				i = ps.executeUpdate();
			}
		}
		catch(Exception e)
		{
			i = -10;
			hata = "" + e.getMessage();
		}
		return hata;
	}
	
	public List<Post> kategoriDetayBul(String categoryId)
	{
		List<Post> posts = new ArrayList<Post>();  
		String hata = "a";
		if(!categoryId.equals(""))
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
					String sql = "Select * from post where category_id = "+categoryId;
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
				hata = ex.toString();
				
			}
		}
		return posts;

	}
	
	public String kategoriPostSayiBul(String categoryId)
	{
		String toplamPost = "0";
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
				String sql = "Select Count(*) from post where category_id = "+categoryId;
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					toplamPost = resultSet.getString(1);
				}
				connection.close();					
			}
		}
		catch(Exception ex)
		{
			
		}
		
		return toplamPost;
	}
	
	public Category getCategoryById(String categoryId)
	{
		Category category = new Category();
		
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
				String sql = "Select * from category where id = " + categoryId;
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					category.setId(categoryId);
					category.setCategory_body(resultSet.getString("category_body"));
				}
				connection.close();					
			}
		}
		catch(Exception ex)
		{
			
		}
		
		return category;
	}
	
	public String kategoriSil(String categoryId)
	{
		String hata = "k";
		if(getCategoryById(categoryId)!=null)
		{
			List<Post> kategoriPosts =  kategoriDetayBul(categoryId);
			if(kategoriPosts != null)
			{
				int i = 0;
				int iPost = 0;
				int iComment = 0;
				try
				{
					PreparedStatement ps = null;
					PreparedStatement psPost = null;
					PreparedStatement psComment = null;
					
					String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
					Connection connection = null; 
					Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
					connection = DriverManager.getConnection(connectionURL, "root", "");
					if(!connection.isClosed())
					{
						String sql="Delete from category where id=?";
						ps = connection.prepareStatement(sql);
						ps.setString(1,categoryId);
						i = ps.executeUpdate();
						
						String sqlPost = "Delete from post where category_id = ?";
						psPost = connection.prepareStatement(sqlPost);
						psPost.setString(1, categoryId);
						iPost = psPost.executeUpdate();
						
						for(Post post: kategoriPosts)
						{
							String sqlComment = "Delete from comment where post_id = ?";
							psComment = connection.prepareStatement(sqlComment);
							psComment.setString(1, post.getId());
							iComment = psComment.executeUpdate();
						}
					}
				}
				catch(Exception e)
				{
					hata += " hata var!! ";
					if(i<=0) hata = hata + " kategori silmede hata var";
					if(iPost<=0) hata = hata + " kategorinin postlarýný silmede hata var";
					if(iComment<=0) hata = hata + " kategorideki postlarýn yorumlarýný silmede hata var";
				}
			}
		}
		else
		{
			hata += " " + categoryId + " idsine ait bir kategori yok.";
		}
		return hata;
	}

}
