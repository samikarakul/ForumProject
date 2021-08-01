package com.forum.classes;

public class Post {
	
	private String id;
	private String user_id;
	private String post_body;
	private String category_id;
	private String user_kullaniciAdi;
	
	
	public Post() {
		super();
	}

	public String getUser_kullaniciAdi() {
		return user_kullaniciAdi;
	}

	public void setUser_kullaniciAdi(String user_kullaniciAdi) {
		this.user_kullaniciAdi = user_kullaniciAdi;
	}

	public Post(String id, String user_id, String post_body, String category_id, String user_kullaniciAdi) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.post_body = post_body;
		this.category_id = category_id;
		this.user_kullaniciAdi = user_kullaniciAdi;
	}





	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getPost_body() {
		return post_body;
	}


	public void setPost_body(String post_body) {
		this.post_body = post_body;
	}


	public String getCategory_id() {
		return category_id;
	}


	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	
	

	
}
