package com.forum.classes;

public class User {
	private String id;
	private String adi;
	private String soyadi;
	private String kullaniciAdi;
	private String kullaniciSifre;
	private String email;
	private String onay;
	private String yetki;

	public User() {
		super();
	}

	public User(String id, String adi, String soyadi, String kullaniciAdi, String kullaniciSifre, String email,
			String onay, String yetki) {
		super();
		this.id = id;
		this.adi = adi;
		this.soyadi = soyadi;
		this.kullaniciAdi = kullaniciAdi;
		this.kullaniciSifre = kullaniciSifre;
		this.email = email;
		this.onay = onay;
		this.yetki = yetki;
	}

	public String getYetki() {
		return yetki;
	}

	public void setYetki(String yetki) {
		this.yetki = yetki;
	}

	public String getOnay() {
		return onay;
	}

	public void setOnay(String onay) {
		this.onay = onay;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAdi() {
		return adi;
	}

	public void setAdi(String adi) {
		this.adi = adi;
	}

	public String getSoyadi() {
		return soyadi;
	}

	public void setSoyadi(String soyadi) {
		this.soyadi = soyadi;
	}

	public String getKullaniciAdi() {
		return kullaniciAdi;
	}

	public void setKullaniciAdi(String kullaniciAdi) {
		this.kullaniciAdi = kullaniciAdi;
	}

	public String getKullaniciSifre() {
		return kullaniciSifre;
	}

	public void setKullaniciSifre(String kullaniciSifre) {
		this.kullaniciSifre = kullaniciSifre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
