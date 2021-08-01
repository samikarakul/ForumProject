package com.forum.javacontrols;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import com.forum.classes.Post;
import com.forum.classes.User;

public class UserControl {
		
	public List<User> KullanicilariGetir()
	{
		List<User> users = new ArrayList<User>();
		
		try 
		{
			Statement statement = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 

			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");

			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				String sql ="select * from user";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					User user = new User();
					user.setId(resultSet.getString("id"));
					user.setAdi(resultSet.getString("adi"));
					user.setSoyadi(resultSet.getString("soyadi"));
					user.setKullaniciAdi(resultSet.getString("kullaniciAdi"));
					user.setEmail(resultSet.getString("email"));
					user.setOnay(resultSet.getString("onay"));
					user.setYetki(resultSet.getString("yetki"));
					
					users.add(user);
				}
				connection.close();
			}
		
		}
		catch(Exception ex)
		{
			
		}
		
		return users;
	}
	
	public boolean dbControl(String sorguKullaniciAdi, String sorguSifre)
	{
		String kullaniciAdlari = "";
		boolean kayitli = false;

		try 
		{
			Statement statement = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 

			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");

			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				String sql ="select * from user";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					String db_email = resultSet.getString("email");
					String db_kullaniciSifre = resultSet.getString("kullaniciSifre");
					if(db_email.equals(sorguKullaniciAdi) && db_kullaniciSifre.equals(sorguSifre))
					{
						kullaniciAdlari = kullaniciAdlari + db_email + "<br>";
						kayitli = true;
						break;
					}
				}
				connection.close();
			}
			return kayitli;
		}
		catch(Exception ex)
		{
			return false;
		}
	}	
	
	public boolean kullaniciEkle(String ad, String soyad, String username, String password, String email)
	{
		try
		{
			String uretilenSayi = randomUret();
			
			Statement statement = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			
			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			
			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				int i=statement.executeUpdate("insert into user(adi,soyadi,kullaniciAdi, kullaniciSifre, email, onay)values('"+ad+"','"+soyad+"','"+username+"','"+password+"','"+email+"','"+uretilenSayi+"')");
				connection.close();
				
			}
			return true;
			
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
	public int kullaniciGuncelle(String kullanici_adi, String kullanici_soyAdi, String kullanici_kullaniciAdi,String kullanici_sifre, String kullanici_email)
	{
		int i = 0;
		try
		{
			
			Statement statement = null;
			PreparedStatement ps = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				String sql="Update user set adi=?,soyadi=?,kullaniciAdi=?,kullaniciSifre=?, email=? where kullaniciAdi='" + kullanici_kullaniciAdi + "'";
				ps = connection.prepareStatement(sql);
				ps.setString(1,kullanici_adi);
				ps.setString(2, kullanici_soyAdi);
				ps.setString(3, kullanici_kullaniciAdi);
				ps.setString(4, kullanici_sifre);
				ps.setString(5, kullanici_email);
				i = ps.executeUpdate();
				
			}
			
		}
		catch(Exception e)
		{
			
		}
		return i;
	}
	
	public String kullaniciGuncelle_yonetici(User user)
	{
		int i = 0;
		String hata  = "k";
		try
		{
			
			Statement statement = null;
			PreparedStatement ps = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				String sql="Update user set adi=?,soyadi=?,kullaniciAdi=?, email=? where id='" + user.getId() + "'";
				ps = connection.prepareStatement(sql);
				ps.setString(1,user.getAdi());
				ps.setString(2, user.getSoyadi());
				ps.setString(3, user.getKullaniciAdi());
				ps.setString(4, user.getEmail());
				i = ps.executeUpdate();
				
			}
			
		}
		catch(Exception e)
		{
			hata = "" + e.getMessage();
		}
		return hata;
	}
	
	public String kullaniciSifreYenile(User user)
	{
		int i = 0;
		String hata  = "k";
		try
		{
			
			PreparedStatement ps = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				String sql="Update user set kullaniciSifre=? where id='" + user.getId() + "'";
				ps = connection.prepareStatement(sql);
				ps.setString(1, user.getKullaniciSifre() );
				i = ps.executeUpdate();
				
			}
			
		}
		catch(Exception e)
		{
			hata = "" + e.getMessage();
		}
		return hata;
	}
	
	public String kullaniciSil_admin(String userId)
	{
		String hata = "k";
		User user = kullaniciBul_kullaniciId(userId);
		if(user!=null)
		{
			PostControl postControl = new PostControl();
			List<Post> userPosts =  postControl.gonderilerimDondur(userId);
			if(userPosts != null)
			{
				int i = 0;
				int iPost = 0;
				int iComment = 0;
				int iPostComment = 0;
				try
				{
					PreparedStatement ps = null;
					PreparedStatement psPost = null;
					PreparedStatement psComment = null;
					PreparedStatement psPostComment = null;
					
					String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
					Connection connection = null; 
					Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
					connection = DriverManager.getConnection(connectionURL, "root", "");
					if(!connection.isClosed())
					{
						String sql="Delete from user where id=?";
						ps = connection.prepareStatement(sql);
						ps.setString(1,userId);
						i = ps.executeUpdate();
						
						String sqlPost = "Delete from post where user_id = ?";
						psPost = connection.prepareStatement(sqlPost);
						psPost.setString(1, userId);
						iPost = psPost.executeUpdate();
						
						String sqlComment = "Delete from comment where user_id = ?";
						psComment = connection.prepareStatement(sqlComment);
						psComment.setString(1, userId);
						iComment = psComment.executeUpdate();
						
						for(Post post: userPosts)
						{
							String sqlPostComment = "Delete from comment where post_id = ?";
							psPostComment = connection.prepareStatement(sqlPostComment);
							psPostComment.setString(1, post.getId());
							iPostComment = psPostComment.executeUpdate();
						}
					}	
				}
				catch(Exception e)
				{
					hata += " hata var!! ";
					if(i<=0) hata = hata + " kullanýcý silmede hata var";
					if(iPost<=0) hata = hata + " kullanýcýnýn postlarýný silmede hata var";
					if(iComment<=0) hata = hata + " kullanýcýnýn yorumlarýný silmede hata var";
					if(iPostComment<=0) hata = hata + " kullanýcýn postlarýnýn yorumlarýný silmede hata var";
				}
			}	
		}
		else
		{
			hata += " " + userId + " idsine ait bir kategori yok.";
		}
		
		
		return hata;
	}
	
	public boolean kullaniciOnayla(String email) 
	{
		int i = 0;
		try
		{
			
			Statement statement = null;
			PreparedStatement ps = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
			{
				String sql="Update user set onay=?, yetki=? where email='" + email + "'";
				ps = connection.prepareStatement(sql);
				ps.setString(1,"1");
				ps.setString(2,"1");
				i = ps.executeUpdate();
				
			}
			if(i>0) return true;
			else return false;
		}
		catch(Exception e)
		{
			return false;
		}
		
	}
	
	public User kullaniciBul_kullaniciId(String kullaniciId)
	{
		User user = new User();
		try
		{
			Statement statement = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			
			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			
			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				String sql ="Select * from user where id = '" + kullaniciId + "'";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					
					user.setId(resultSet.getString("id"));	
					user.setAdi(resultSet.getString("adi"));
					user.setSoyadi(resultSet.getString("soyadi"));
					user.setKullaniciAdi(resultSet.getString("kullaniciAdi"));
					user.setEmail(resultSet.getString("email"));
					user.setOnay(resultSet.getString("onay"));
					user.setYetki(resultSet.getString("yetki"));
				}
				connection.close();
				
			}
			
		}
		catch(Exception e)
		{
			
		}
				
		return user;
	}
	
	public User kullaniciBul_kullaniciAdi(String kullaniciAdi)
	{
		String db_kullaniciId = "";
		String db_adi = "";
		String db_soyAdi = "";
		String db_kullaniciAdi = "";
		String db_kullaniciSifre = "";
		String db_email = "";
		String db_onay = "";
		String db_yetki = "";
		
		String donus = "bos";
		try
		{
			Statement statement = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			
			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			
			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				String sql ="Select * from user where kullaniciAdi = '" + kullaniciAdi + "'";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					db_kullaniciId = resultSet.getString("id");
					db_adi = resultSet.getString("adi");
					db_soyAdi = resultSet.getString("soyadi");
					db_kullaniciAdi = resultSet.getString("kullaniciAdi");
					db_kullaniciSifre = resultSet.getString("kullaniciSifre");
					db_email = resultSet.getString("email");
					db_yetki = resultSet.getString("yetki");
					
				}
				connection.close();
				
			}
			donus = "sorun yok";
		}
		catch(Exception e)
		{
			donus = e.toString();
		}
		
		User user = new User(db_kullaniciId, db_adi, db_soyAdi, db_kullaniciAdi, db_kullaniciSifre, db_email, db_onay, db_yetki);
		
		return user;
	}
	
	public User kullaniciBul_email(String email)
	{
		String db_kullaniciId = "";
		String db_adi = "";
		String db_soyAdi = "";
		String db_kullaniciAdi = "";
		String db_kullaniciSifre = "";
		String db_email = "";
		String db_onay = "";
		String db_yetki = "";
		
		String donus = "bos";
		try
		{
			Statement statement = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&useSSL=false"; 
			
			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			
			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				String sql ="Select * from user where email = '" + email + "'";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					db_kullaniciId = resultSet.getString("id");
					db_adi = resultSet.getString("adi");
					db_soyAdi = resultSet.getString("soyadi");
					db_kullaniciAdi = resultSet.getString("kullaniciAdi");
					db_kullaniciSifre = resultSet.getString("kullaniciSifre");
					db_email = resultSet.getString("email");
					db_onay = resultSet.getString("onay");
					db_yetki = resultSet.getString("yetki");
					
				}
				connection.close();
				
			}
			donus = "sorun yok";
		}
		catch(Exception e)
		{
			donus = e.toString();
		}
		
		User user = new User(db_kullaniciId, db_adi, db_soyAdi, db_kullaniciAdi, db_kullaniciSifre, db_email, db_onay, db_yetki);
		
		return user;
	}
	
	public String onayEmailiGonder(String email)
	{
		User user = kullaniciBul_email(email);
		
	    String result = "sent";
	    
	    final String to = user.getEmail();
	    final String subject = "onay kodunuz";
	    final String messg = "Size özel onay kodu: "+ user.getOnay();
	 
	    final String from = "[email adress]";
	    final String pass = "[password]";

	    String host = "smtp.live.com";
	 
	    Properties props = new Properties();

	    props.put("mail.smtp.host", host);
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.username", from);
	    props.put("mail.password", pass);
	    props.put("mail.smtp.port", "587");
	 
	    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(from, pass);
	        }
	    });
	 
	    try {
	       
	        MimeMessage message = new MimeMessage(mailSession);
	        
	        message.setFrom(new InternetAddress(from));
	        
	        message.addRecipient(Message.RecipientType.TO,
	                new InternetAddress(to));
	        
	        message.setSubject(subject);
	        
	        message.setText(messg);
	        
	        Transport.send(message);
	        result = "sent";
	    } catch (MessagingException mex) {
	        mex.printStackTrace();
	        result = "error";
	    }
	    return result;
	}
	
	public String randomUret()
	{
		String birlesecek="";
		for(int i=0; i<6; i++)
		{
			int sayi = (int)(Math.random()*10);
			birlesecek = birlesecek + String.valueOf(sayi);
		}
		
		return birlesecek;
	}
	
	public boolean onayKoduKontrolEt(String email, String onayKodu)
	{
		User user = kullaniciBul_email(email);
		if(user.getOnay().equals(onayKodu)) return true;
		return false;
	}
	
	public User KullaniciSifreUnuttumHashSorgu(String hashedKey)
	{
		MD5 md5 = new MD5();
		User user = new User();
		try 
		{
			Statement statement = null;
			ResultSet resultSet = null;
			
			String connectionURL = "jdbc:mysql://localhost:3306/forum?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey"; 

			Connection connection = null; 
			
			Class.forName("com.mysql.jdbc.Driver").getConstructor().newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");

			if(!connection.isClosed())
			{
				statement=connection.createStatement();
				String sql ="select * from user";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					
					if(md5.matching(hashedKey, resultSet.getString("id")))
					{
						user.setId(resultSet.getString("id"));
						user.setAdi(resultSet.getString("adi"));
						user.setSoyadi(resultSet.getString("soyadi"));
						user.setKullaniciAdi(resultSet.getString("kullaniciAdi"));
						user.setEmail(resultSet.getString("email"));
						user.setOnay(resultSet.getString("onay"));
						user.setYetki(resultSet.getString("yetki"));
						
						break;
					}
				}
				connection.close();
			}
		
		}
		catch(Exception ex)
		{
			
		}
		
		return user;
	}
	
	public String KullaniciSifreYenilemeMailiGonder(String email, String hashedKey)
	{
		User user = kullaniciBul_email(email);
		
	    String result = "k";
	    String adres = "http://localhost:8083/ForumProjesi/sifreyenilemeistegi.jsp?hashkey="+hashedKey;
	    
	    final String to = user.getEmail();
	    final String subject = "Þifrenizi Yenilemek Ýçin linke týklayýn";
	    final String messg = adres;
	 
	    final String from = "[email adress]";
	    final String pass = "[password]";
	 
	 
	    
	    String host = "smtp.live.com";
	 
	    Properties props = new Properties();
	 
	    
	    props.put("mail.smtp.host", host);
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.username", from);
	    props.put("mail.password", pass);
	    props.put("mail.smtp.port", "587");
	 
	    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(from, pass);
	        }
	    });
	 
	    try {
	       
	        MimeMessage message = new MimeMessage(mailSession);
	        
	        message.setFrom(new InternetAddress(from));
	        
	        message.addRecipient(Message.RecipientType.TO,
	                new InternetAddress(to));
	        
	        message.setSubject(subject);
	        
	        message.setText(messg);
	        
	        Transport.send(message);
	    } catch (MessagingException mex) {
	        mex.printStackTrace();
	        result = "error";
	    }
	    return result;
	}
	
}

