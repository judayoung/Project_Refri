package com.example.Refri.mem;

public class Refrimem {

	private String id;
	private String pwd;
	private String pwd_q;
	private String pwd_a;
	private String family;

	public Refrimem() {
		super();
	}

	public Refrimem(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public Refrimem(String id, String pwd, String pwd_q, String pwd_a) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.pwd_q = pwd_q;
		this.pwd_a = pwd_a;
	}

	public Refrimem(String id, String pwd, String pwd_q, String pwd_a, String family) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.pwd_q = pwd_q;
		this.pwd_a = pwd_a;
		this.family = family;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwd_q() {
		return pwd_q;
	}

	public void setPwd_q(String pwd_q) {
		this.pwd_q = pwd_q;
	}

	public String getPwd_a() {
		return pwd_a;
	}

	public void setPwd_a(String pwd_a) {
		this.pwd_a = pwd_a;
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	@Override
	public String toString() {
		return "Refrimem [id=" + id + ", pwd=" + pwd + ", pwd_q=" + pwd_q + ", pwd_a=" + pwd_a + ", family=" + family
				+ "]";
	}

}
