package com.forum.classes;

public class Category {
	private String id;
	private String category_body;
	
	
	public Category() {
		super();
	}

	public Category(String id, String category_body) {
		super();
		this.id = id;
		this.category_body = category_body;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory_body() {
		return category_body;
	}
	public void setCategory_body(String category_body) {
		this.category_body = category_body;
	}
	
	
}
